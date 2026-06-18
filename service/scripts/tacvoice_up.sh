#!/usr/bin/env bash
set -euo pipefail

# Local TacVoice on UDS: stands up the platform if needed, then builds and deploys
# the TacVoice Zarf package onto k3d (Docker Engine + k3d + UDS Core slim-dev).

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SERVICE_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
REPO_ROOT="$(cd "${SERVICE_ROOT}/.." && pwd)"
UDS_DIR="${REPO_ROOT}/uds"

# shellcheck source=scratch_dirs.sh
source "${SCRIPT_DIR}/scratch_dirs.sh"
scratch_dirs_init

"${SCRIPT_DIR}/install_uds.sh"

# shellcheck source=uds/setup_docker.sh
source "${UDS_DIR}/setup_docker.sh"

command_exists() { command -v "$1" >/dev/null 2>&1; }
require() { command_exists "$1" || { echo "'$1' not found." >&2; exit 1; }; }

require uds
require docker

"${SCRIPT_DIR}/build_uds_package.sh" "$@"

MANIFEST="${REPO_ROOT}/uds_package/manifest.json"
if [ ! -f "${MANIFEST}" ]; then
    echo "ERROR: ${MANIFEST} missing after build." >&2
    exit 1
fi

TACVOICE_TAG="$(python3 -c "import json; print(json.load(open('${MANIFEST}'))['tacvoice_tag'])")"
PKG_NAME="$(python3 -c "import json; print(json.load(open('${MANIFEST}'))['zarf_package'])")"
PKG="${REPO_ROOT}/uds_package/${PKG_NAME}"

echo "Ensuring PKCE public SSO clients are allowed..."
"${UDS_DIR}/enable_public_clients.sh"

echo "Deploying ${PKG} onto the UDS cluster..."
uds zarf package deploy "${PKG}" --confirm --set-variables TACVOICE_TAG="${TACVOICE_TAG}" \
    --tmpdir "${TMPDIR}" --zarf-cache "${UDS_CACHE}"

echo "Waiting for the TacVoice rollout..."
uds zarf tools kubectl -n tacvoice rollout status deploy/tacvoice --timeout=600s || true

BASE_URL="https://tacvoice.uds.dev"
if ! curl -sk -o /dev/null -w '%{http_code}' --max-time 5 "${BASE_URL}/" 2>/dev/null | grep -qx 200; then
    echo "Host edge not ready on :443; starting dev gateway forward..."
    "${UDS_DIR}/host_gateway.sh" start
    BASE_URL="https://tacvoice.uds.dev:18443"
fi

echo ""
echo "TacVoice deployed. Open:"
echo "    ${BASE_URL}/"
echo ""
echo "Monitoring & Observability (Grafana, Loki, Prometheus):"
"${UDS_DIR}/observability.sh" urls 2>/dev/null || true
if ! "${UDS_DIR}/observability.sh" diag >/dev/null 2>&1; then
    echo "  Admin gateway not reachable on :443; run: ${UDS_DIR}/observability.sh start"
fi

for asset in js/auth-oidc.js .well-known/tacvoice/oidc.json; do
    code="$(curl -sk -o /dev/null -w '%{http_code}' --max-time 10 "${BASE_URL}/${asset}" 2>/dev/null || echo 000)"
    if [ "${code}" = "200" ]; then
        echo "  OK ${asset}"
    else
        echo "  WARN ${asset} returned HTTP ${code} (OIDC redirect will not work until this is 200)" >&2
    fi
done
echo "Tear down the app: ./service/scripts/tacvoice_down.sh"
echo "Tear down everything: ./service/scripts/remove_uds.sh"
