#!/usr/bin/env bash
set -euo pipefail

# ZTXS release builder (all service binaries).
# TMPDIR is redirected via ../.cargo/config.toml and env_build.sh.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
# shellcheck source=env_build.sh
source "${SCRIPT_DIR}/env_build.sh"

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

for cmd in cargo cc cmake go; do
    if ! command_exists "${cmd}"; then
        echo "Error: required command '${cmd}' not found in PATH" >&2
        exit 1
    fi
done

echo "TMPDIR=${TMPDIR}"
pushd "${ZTXS_ROOT}" >/dev/null

BINS=(tvks tvfs tvws tvls tvps voicerepo msgrepo)
for bin in "${BINS[@]}"; do
    echo "Building ${bin} (release)..."
    cargo build --release --bin "${bin}"
done

popd >/dev/null

echo ""
echo "ZTXS build completed under ${ZTXS_ROOT}/target/release/"
