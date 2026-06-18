#!/usr/bin/env bash
set -euo pipefail

# Deploys UDS Core on a fresh k3d cluster using a published UDS bundle.
# Default: k3d-core-demo (full Core incl. Grafana, Loki, Prometheus).
# Lightweight (no observability): UDS_CORE_BUNDLE=k3d-core-slim-dev:1.6.0
#
# Requires: Docker Desktop, uds CLI (install_uds_cli.sh), k3d (install_k3d.sh).

UDS_CORE_VERSION="${UDS_CORE_VERSION:-1.6.0}"
BUNDLE_REF="${UDS_CORE_BUNDLE:-k3d-core-demo:${UDS_CORE_VERSION}}"
UDS_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "${UDS_DIR}/.." && pwd)"
export UDS_CONFIG="${UDS_CONFIG:-${UDS_DIR}/uds-config.yaml}"

# shellcheck source=service/scripts/scratch_dirs.sh
source "${REPO_ROOT}/service/scripts/scratch_dirs.sh"
scratch_dirs_init

# shellcheck source=setup_docker.sh
source "${UDS_DIR}/setup_docker.sh"

command_exists() { command -v "$1" >/dev/null 2>&1; }

if ! command_exists uds; then
    echo "uds CLI not found; run install_uds_cli.sh first." >&2; exit 1
fi
if ! command_exists k3d; then
    echo "k3d not found; run install_k3d.sh first." >&2; exit 1
fi
if ! command_exists docker; then
    echo "docker not found; install Docker Desktop and run setup_docker.sh." >&2; exit 1
fi

# UDS Istio ambient (istio-cni, ztunnel) needs raised inotify limits on the host.
# Default Linux (128 instances) causes ztunnel: "Too many open files (os error 24)".
check_host_inotify_limits() {
    local instances watches
    instances="$(sysctl -n fs.inotify.max_user_instances 2>/dev/null || echo 0)"
    watches="$(sysctl -n fs.inotify.max_user_watches 2>/dev/null || echo 0)"
    if [ "${instances}" -lt 1024 ] || [ "${watches}" -lt 1048576 ]; then
        echo "ERROR: host inotify limits are too low for UDS Core (istio-cni/ztunnel)." >&2
        echo "  fs.inotify.max_user_instances=${instances} (need >= 1024)" >&2
        echo "  fs.inotify.max_user_watches=${watches} (need >= 1048576)" >&2
        echo "Raise limits (once, as root), then re-run this script:" >&2
        echo "  sudo sysctl -w fs.inotify.max_user_instances=1024 fs.inotify.max_user_watches=1048576" >&2
        echo "  echo 'fs.inotify.max_user_instances=1024' | sudo tee /etc/sysctl.d/99-uds-inotify.conf" >&2
        echo "  echo 'fs.inotify.max_user_watches=1048576' | sudo tee -a /etc/sysctl.d/99-uds-inotify.conf" >&2
        return 1
    fi
}
check_host_inotify_limits

host_k3s_leftovers() {
    if command_exists systemctl && systemctl is-active --quiet k3s 2>/dev/null; then
        return 0
    fi
    if pgrep -f '^traefik traefik ' >/dev/null 2>&1; then
        return 0
    fi
    if ip link show flannel.1 >/dev/null 2>&1; then
        return 0
    fi
    return 1
}

# Host k3s (non-k3d) from older installs binds :443 with Traefik and breaks
# https://tacvoice.uds.dev/ on 127.0.0.1 even when the k3d UDS cluster is healthy.
if host_k3s_leftovers; then
    echo "ERROR: host k3s leftovers are still running (orphan Traefik / flannel)." >&2
    echo "They steal host :443 from k3d even after 'systemctl stop k3s'." >&2
    echo "Clean them up before deploying UDS Core:" >&2
    echo "  sudo /usr/local/bin/k3s-killall.sh" >&2
    echo "To prevent on boot: sudo systemctl disable k3s" >&2
    exit 1
fi

# A previously failed deploy can leave the k3s-airgap-images volume behind; the
# bundle's load action is not idempotent and errors if it exists.
if ! k3d cluster list 2>/dev/null | awk 'NR>1 {print $1}' | grep -qx uds \
    && docker volume inspect k3s-airgap-images >/dev/null 2>&1; then
    echo "Removing orphaned k3s-airgap-images volume from a prior failed run..."
    docker volume rm k3s-airgap-images >/dev/null 2>&1 || true
fi

echo "Deploying UDS Core bundle ${BUNDLE_REF}..."
cd "${UDS_DIR}"
uds deploy "${BUNDLE_REF}" --confirm --tmpdir "${TMPDIR}" --uds-cache "${UDS_CACHE}"

echo "Enabling PKCE public SSO clients for TacVoice..."
"${UDS_DIR}/enable_public_clients.sh"

echo ""
echo "UDS Core deployed (${BUNDLE_REF})."
if echo "${BUNDLE_REF}" | grep -q slim-dev; then
    echo "Slim-dev has no Grafana/Loki; run install_uds_observability.sh for redeploy guidance."
else
    echo "Observability: https://grafana.admin.uds.dev (after pods are Ready)"
fi
echo "Keycloak admin and SSO: *.uds.dev via the k3d load balancer."
echo "Next: ./service/scripts/tacvoice_up.sh"
