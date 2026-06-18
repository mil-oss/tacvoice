#!/usr/bin/env bash
set -euo pipefail

# TacVoice release builder.
# aws-lc-sys (FIPS mTLS) compile temps; TMPDIR is redirected via ../.cargo/config.toml.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
SERVICE_ROOT="${PROJECT_ROOT}/service"
TMPDIR="${TMPDIR:-${PROJECT_ROOT}/temp}"

mkdir -p "${TMPDIR}"
export TMPDIR

FIPS_CCFLAGS="-Wno-error=discarded-qualifiers -Wno-discarded-qualifiers"
FIPS_GCC_CCFLAGS="${FIPS_CCFLAGS} -fno-tree-slp-vectorize"
export AWS_LC_FIPS_SYS_CFLAGS="${AWS_LC_FIPS_SYS_CFLAGS:-${FIPS_GCC_CCFLAGS}}"
export AWS_LC_SYS_CFLAGS="${AWS_LC_SYS_CFLAGS:-${FIPS_CCFLAGS}}"

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

# WASM must be built before cargo so rust-embed picks up assets/www/js/pkg.
"${SCRIPT_DIR}/build_wasm.sh"

pushd "${SERVICE_ROOT}" >/dev/null

APP_BINS=(transcriber recognizer tacvoice)
for bin in "${APP_BINS[@]}"; do
    echo "Building ${bin} (release)..."
    cargo build --release --bin "${bin}"
done

popd >/dev/null

echo ""
echo "Build completed under ${SERVICE_ROOT}/target/release/: ${APP_BINS[*]}"
