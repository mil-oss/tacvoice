#!/usr/bin/env bash
set -euo pipefail

# Removes the local UDS Core k3d cluster and leftover Docker state.

UDS_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "${UDS_DIR}/.." && pwd)"

# shellcheck source=service/scripts/scratch_dirs.sh
source "${REPO_ROOT}/service/scripts/scratch_dirs.sh"
scratch_dirs_init

# shellcheck source=setup_docker.sh
source "${UDS_DIR}/setup_docker.sh"

command_exists() { command -v "$1" >/dev/null 2>&1; }

if [ -x "${UDS_DIR}/host_gateway.sh" ]; then
    "${UDS_DIR}/host_gateway.sh" stop 2>/dev/null || true
fi

# A leftover host k3s (from pre-Docker Desktop / rootless runs) binds :443 with
# Traefik servicelb and steals localhost traffic from k3d's docker-proxy.
# systemctl stop alone leaves orphan Traefik pods and flannel/cni0 on the host.
stop_host_k3s() {
    if ! command_exists systemctl; then
        return 0
    fi
    local needs_kill=false
    if systemctl is-active --quiet k3s 2>/dev/null; then
        needs_kill=true
    elif pgrep -f '^traefik traefik ' >/dev/null 2>&1; then
        needs_kill=true
    elif ip link show flannel.1 >/dev/null 2>&1; then
        needs_kill=true
    fi
    if [ "${needs_kill}" != "true" ]; then
        return 0
    fi
    echo "Cleaning orphaned host k3s state (Traefik/flannel can steal host :443)..."
    if [ -x /usr/local/bin/k3s-killall.sh ]; then
        if /usr/local/bin/k3s-killall.sh 2>/dev/null; then
            echo "Host k3s killall complete."
            return 0
        fi
        echo "WARN: k3s-killall failed; run: sudo /usr/local/bin/k3s-killall.sh" >&2
        return 0
    fi
    if systemctl stop k3s 2>/dev/null; then
        echo "Host k3s stopped."
    else
        echo "WARN: could not stop k3s; run: sudo systemctl stop k3s" >&2
    fi
}
stop_host_k3s

if command_exists k3d && k3d cluster list 2>/dev/null | awk 'NR>1 {print $1}' | grep -qx uds; then
    echo "Deleting k3d cluster 'uds'..."
    k3d cluster delete uds --timeout 60s 2>/dev/null || k3d cluster delete uds 2>/dev/null || true
else
    echo "No k3d cluster 'uds' found."
fi

if command_exists docker; then
    docker rm -f k3d-uds-serverlb k3d-uds-server-0 k3d-uds-tools 2>/dev/null || true
fi

if command_exists docker \
    && command_exists k3d \
    && ! k3d cluster list 2>/dev/null | awk 'NR>1 {print $1}' | grep -qx uds; then
    docker volume rm k3s-airgap-images 2>/dev/null && echo "Removed orphaned k3s-airgap-images volume." || true
    docker volume rm k3d-uds-images 2>/dev/null || true
fi

echo "UDS Core removed."
