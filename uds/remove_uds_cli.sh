#!/usr/bin/env bash
set -euo pipefail

# Removes the UDS CLI binary installed by install_uds_cli.sh.

DEST="${DEST:-/usr/local/bin/uds}"

if [ -e "${DEST}" ]; then
    echo "Removing ${DEST}..."
    sudo rm -f "${DEST}"
else
    echo "UDS CLI not found at ${DEST}; nothing to remove."
fi
