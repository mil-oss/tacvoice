#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${PROJECT_ROOT}"

for bin in tacvoice transcriber recognizer; do
    echo "Stopping ${bin}..."
    ssh ztxs "pkill -TERM -f '/home/ztxs/${bin}\$' 2>/dev/null || true"
    for _ in 1 2 3 4 5; do
        if ! ssh ztxs "pgrep -f '/home/ztxs/${bin}\$' >/dev/null 2>&1"; then
            break
        fi
        sleep 1
        ssh ztxs "pkill -KILL -f '/home/ztxs/${bin}\$' 2>/dev/null || true"
    done
done
