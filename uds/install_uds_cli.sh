#!/usr/bin/env bash
set -euo pipefail

# Installs the UDS CLI binary into /usr/local/bin. Pin a version with
# UDS_CLI_VERSION (e.g. v0.27.0); defaults to the latest GitHub release.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
WORK_DIR="${REPO_ROOT}/temp"          # repo-local scratch; never /tmp
DEST="${DEST:-/usr/local/bin/uds}"
VERSION="${UDS_CLI_VERSION:-}"

case "$(uname -m)" in
    x86_64|amd64) ARCH="amd64" ;;
    aarch64|arm64) ARCH="arm64" ;;
    *) echo "Unsupported architecture: $(uname -m)" >&2; exit 1 ;;
esac

if [ -z "${VERSION}" ]; then
    echo "Resolving latest UDS CLI release..."
    # Capture the full response first; piping curl into `grep -m1` makes grep
    # close the pipe early, which trips curl (exit 23) under `set -o pipefail`.
    RELEASE_JSON="$(curl -fsSL https://api.github.com/repos/defenseunicorns/uds-cli/releases/latest)"
    VERSION="$(printf '%s' "${RELEASE_JSON}" | grep '"tag_name"' | head -n1 | cut -d'"' -f4)"
fi
if [ -z "${VERSION}" ]; then
    echo "Could not resolve UDS CLI version" >&2; exit 1
fi

URL="https://github.com/defenseunicorns/uds-cli/releases/download/${VERSION}/uds-cli_${VERSION}_Linux_${ARCH}"
mkdir -p "${WORK_DIR}"
DOWNLOAD="${WORK_DIR}/uds-cli_${VERSION}_${ARCH}"
echo "Downloading UDS CLI ${VERSION} (${ARCH})..."
curl -fsSL -o "${DOWNLOAD}" "${URL}"
sudo install -m 0755 "${DOWNLOAD}" "${DEST}"
rm -f "${DOWNLOAD}"

echo "Installed: $("${DEST}" version 2>/dev/null || echo "${DEST}")"
