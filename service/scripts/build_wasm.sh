#!/usr/bin/env bash
set -euo pipefail

# Build the TacVoice WASM client into service/assets/www/js/pkg so rust-embed
# bakes the fresh module at tacvoice compile time.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
CLIENT_ROOT="${PROJECT_ROOT}/client"
WASM_OUT_DIR="${PROJECT_ROOT}/service/assets/www/js/pkg"
TMPDIR="${TMPDIR:-${PROJECT_ROOT}/temp}"

mkdir -p "${TMPDIR}"
export TMPDIR

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

for cmd in cargo wasm-pack; do
    if ! command_exists "${cmd}"; then
        echo "Error: required command '${cmd}' not found in PATH" >&2
        exit 1
    fi
done

echo "Building tacvoice WASM client -> ${WASM_OUT_DIR}"
pushd "${CLIENT_ROOT}" >/dev/null
wasm-pack build --target web --out-dir "${WASM_OUT_DIR}" --out-name tacvoice --no-typescript --release
popd >/dev/null

echo "WASM build completed."
