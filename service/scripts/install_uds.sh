#!/usr/bin/env bash
set -euo pipefail

# Ensures the local UDS platform is installed and the k3d cluster is reachable:
# Docker Engine, UDS CLI, k3d, and UDS Core (k3d-core-demo by default, incl.
# Grafana/Loki/Prometheus). Idempotent — skips work when the cluster is already up.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SERVICE_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
REPO_ROOT="$(cd "${SERVICE_ROOT}/.." && pwd)"
UDS_DIR="${REPO_ROOT}/uds"

# shellcheck source=scratch_dirs.sh
source "${SCRIPT_DIR}/scratch_dirs.sh"
scratch_dirs_init

# Must run before any docker/k3d call (clears legacy Podman DOCKER_HOST from ~/.bashrc).
# shellcheck source=uds/setup_docker.sh
source "${UDS_DIR}/setup_docker.sh"

command_exists() { command -v "$1" >/dev/null 2>&1; }
require() { command_exists "$1" || { echo "'$1' not found." >&2; exit 1; }; }

install_uds_platform() {
    echo "[platform 1/4] Installing UDS CLI..."
    "${UDS_DIR}/install_uds_cli.sh"

    echo "[platform 2/4] Docker Engine (data-root + verify)..."
    "${UDS_DIR}/setup_docker_data_root.sh"
    source "${UDS_DIR}/setup_docker.sh"

    echo "[platform 3/4] Installing k3d..."
    "${UDS_DIR}/install_k3d.sh"

    echo "[platform 4/4] Deploying UDS Core (k3d cluster + full Core stack)..."
    "${UDS_DIR}/install_uds_core.sh"
}

if ! command_exists uds; then
    install_uds_platform
elif ! uds zarf tools kubectl cluster-info >/dev/null 2>&1; then
    echo "No running UDS cluster; standing up the platform..."
    install_uds_platform
else
    echo "UDS cluster reachable."
    "${UDS_DIR}/install_uds_observability.sh" 2>/dev/null || true
fi

require uds
require docker
require k3d

echo "UDS platform ready."
