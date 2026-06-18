#!/usr/bin/env bash
set -euo pipefail

# Removes the TacVoice Zarf package from the UDS cluster, leaving UDS Core (Istio,
# Keycloak, Pepr) and the k3d cluster running. Pass --registry to also stop the
# throwaway local image registry. Full platform teardown is remove_uds.sh.

PKG_NAME="${TACVOICE_PKG_NAME:-tacvoice}"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"

# shellcheck source=scratch_dirs.sh
source "${SCRIPT_DIR}/scratch_dirs.sh"
scratch_dirs_init

command_exists() { command -v "$1" >/dev/null 2>&1; }

if ! command_exists uds; then
    echo "uds CLI not found; nothing to remove."
    exit 0
fi

echo "Removing TacVoice package '${PKG_NAME}' from the cluster..."
uds zarf package remove "${PKG_NAME}" --confirm \
    --tmpdir "${TMPDIR}" --zarf-cache "${UDS_CACHE}" || \
    echo "Package '${PKG_NAME}' not found or already removed."

if [[ "${1:-}" == "--registry" ]]; then
    if command_exists docker; then
        echo "Stopping local image registry..."
        docker rm -f tacvoice-registry 2>/dev/null || true
    fi
fi

echo "TacVoice app removed; UDS Core left running."
