#!/usr/bin/env bash
set -euo pipefail

# Deletes any k3d clusters (including the UDS "uds" cluster) and removes the k3d
# binary installed by install_k3d.sh.

command_exists() { command -v "$1" >/dev/null 2>&1; }

if command_exists k3d; then
    echo "Deleting all k3d clusters..."
    k3d cluster delete --all || true
    echo "Removing k3d binary..."
    sudo rm -f /usr/local/bin/k3d "$(command -v k3d 2>/dev/null || true)" 2>/dev/null || true
else
    echo "k3d not found; nothing to remove."
fi
