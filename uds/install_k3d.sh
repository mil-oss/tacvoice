#!/usr/bin/env bash
set -euo pipefail

# Installs the k3d binary (the cluster itself is created by UDS Core's uds-k3d
# package in install_uds_core.sh). Pin a version with K3D_VERSION (e.g. v5.7.4);
# defaults to the latest k3d release.

K3D_VERSION="${K3D_VERSION:-}"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# shellcheck source=service/scripts/scratch_dirs.sh
source "${REPO_ROOT}/service/scripts/scratch_dirs.sh"
scratch_dirs_init

command_exists() { command -v "$1" >/dev/null 2>&1; }

if command_exists k3d; then
    echo "k3d already installed: $(k3d version | head -n1)"
    exit 0
fi

if ! command_exists docker; then
    echo "ERROR: docker not found; install Docker Desktop before k3d." >&2
    exit 1
fi

echo "Installing k3d${K3D_VERSION:+ ${K3D_VERSION}}..."
if [ -n "${K3D_VERSION}" ]; then
    curl -fsSL https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | TAG="${K3D_VERSION}" bash
else
    curl -fsSL https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
fi

echo "Installed: $(k3d version | head -n1)"
