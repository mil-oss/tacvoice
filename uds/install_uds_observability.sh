#!/usr/bin/env bash
set -euo pipefail

# Ensures the UDS observability stack (Grafana, Loki, Prometheus) is present.
#
# k3d-core-demo includes observability in its monolithic "core" package — use that
# bundle for new installs (default in install_uds_core.sh).
#
# k3d-core-slim-dev does NOT include observability, and the full "core" package
# cannot be layered on top (Helm CRD ownership conflicts). Slim-only clusters
# must be redeployed with k3d-core-demo.

UDS_CORE_VERSION="${UDS_CORE_VERSION:-1.6.0}"
UDS_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "${UDS_DIR}/.." && pwd)"

# shellcheck source=service/scripts/scratch_dirs.sh
source "${REPO_ROOT}/service/scripts/scratch_dirs.sh"
scratch_dirs_init

command_exists() { command -v "$1" >/dev/null 2>&1; }

observability_ready() {
    command_exists uds || return 1
    uds zarf tools kubectl cluster-info >/dev/null 2>&1 || return 1
    uds zarf tools kubectl get ns grafana >/dev/null 2>&1 || return 1
    uds zarf tools kubectl get ns monitoring >/dev/null 2>&1 || return 1
    local grafana_pods
    grafana_pods="$(uds zarf tools kubectl get pods -n grafana \
        -l app.kubernetes.io/name=grafana \
        --field-selector=status.phase=Running -o name 2>/dev/null | wc -l | tr -d ' ')"
    [ "${grafana_pods}" -gt 0 ]
}

slim_dev_cluster() {
    uds zarf tools kubectl get ns keycloak >/dev/null 2>&1 \
        && ! uds zarf tools kubectl get ns grafana >/dev/null 2>&1
}

print_redeploy_instructions() {
    cat <<EOF
ERROR: This cluster runs k3d-core-slim-dev, which has no Grafana/Loki/Prometheus.

Observability cannot be added incrementally — deploying the k3d-core-demo "core"
package on slim-dev fails with Helm CRD ownership conflicts (gateway-api-crds).

Redeploy the platform with the full demo bundle:

  ./service/scripts/remove_uds.sh
  UDS_CORE_BUNDLE=k3d-core-demo:${UDS_CORE_VERSION} ./service/scripts/install_uds.sh
  ./service/scripts/tacvoice_up.sh

Or stay on slim-dev and use kubectl logs only (no Grafana).

EOF
}

if observability_ready; then
    echo "UDS observability stack ready (Grafana + Prometheus)."
    exit 0
fi

if ! command_exists uds; then
    echo "uds CLI not found; run install_uds_cli.sh first." >&2
    exit 1
fi
if ! uds zarf tools kubectl cluster-info >/dev/null 2>&1; then
    echo "No UDS cluster reachable; deploy UDS Core first." >&2
    exit 1
fi

if slim_dev_cluster; then
    print_redeploy_instructions >&2
    exit 1
fi

echo "Observability namespaces not ready yet; waiting for Grafana..."
for _ in $(seq 1 60); do
    if observability_ready; then
        echo "UDS observability stack ready."
        exit 0
    fi
    sleep 5
done

echo "WARN: Grafana namespace exists but pods may still be starting." >&2
uds zarf tools kubectl get pods -n grafana 2>/dev/null || true
uds zarf tools kubectl get pods -n monitoring 2>/dev/null || true
exit 1
