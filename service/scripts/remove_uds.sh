#!/usr/bin/env bash
set -euo pipefail

# Full teardown of the local UDS platform, in reverse install order:
#   1. TacVoice app        (uds zarf package remove)
#   2. UDS Core + cluster  (uds/remove_uds_core.sh)
#   3. k3d binary/clusters (uds/remove_k3d.sh)
#   4. UDS CLI             (uds/remove_uds_cli.sh)
#   5. local registry      (docker rm)
#
# Docker Desktop is left installed.
# Every step is best-effort so a partial install still cleans up.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SERVICE_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
REPO_ROOT="$(cd "${SERVICE_ROOT}/.." && pwd)"
UDS_DIR="${REPO_ROOT}/uds"

# shellcheck source=scratch_dirs.sh
source "${SCRIPT_DIR}/scratch_dirs.sh"
scratch_dirs_init

command_exists() { command -v "$1" >/dev/null 2>&1; }

echo "[1/5] Removing TacVoice app..."
if command_exists uds; then
    uds zarf package remove tacvoice --confirm \
        --tmpdir "${TMPDIR}" --zarf-cache "${UDS_CACHE}" 2>/dev/null || true
fi

echo "[2/5] Removing UDS Core + k3d cluster..."
"${UDS_DIR}/remove_uds_core.sh" || true

echo "[3/5] Removing k3d..."
"${UDS_DIR}/remove_k3d.sh" || true

echo "[4/5] Removing UDS CLI..."
"${UDS_DIR}/remove_uds_cli.sh" || true

echo "[5/5] Removing local image registry..."
if command_exists docker; then
    docker rm -f tacvoice-registry 2>/dev/null || true
fi

echo ""
echo "UDS platform removed."
