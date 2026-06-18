#!/usr/bin/env bash
set -euo pipefail

# Publish uds_package/ artifacts to an OCI registry (e.g. ghcr.io).
# Requires: docker login to the target registry, uds_package/ from build_uds_package.sh.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

# shellcheck source=scratch_dirs.sh
source "${SCRIPT_DIR}/scratch_dirs.sh"
scratch_dirs_init

PACKAGE_DIR="${REPO_ROOT}/uds_package"
MANIFEST="${PACKAGE_DIR}/manifest.json"
PUBLISH_BUNDLE="${PUBLISH_BUNDLE:-1}"
PUBLISH_ZARF="${PUBLISH_ZARF:-0}"

usage() {
    echo "Usage: OCI_BUNDLE_REF=oci://ghcr.io/org/uds-bundles/tacvoice:tag \\" >&2
    echo "       [OCI_ZARF_REF=oci://ghcr.io/org/uds-packages/tacvoice:tag] \\" >&2
    echo "       $0 [--bundle-only] [--zarf-only]" >&2
    exit 1
}

while [ $# -gt 0 ]; do
    case "$1" in
        --bundle-only) PUBLISH_ZARF=0; shift ;;
        --zarf-only) PUBLISH_BUNDLE=0; PUBLISH_ZARF=1; shift ;;
        -h|--help) usage ;;
        *) echo "Unknown option: $1" >&2; usage ;;
    esac
done

if [ ! -f "${MANIFEST}" ]; then
    echo "ERROR: ${MANIFEST} not found; run ./service/scripts/build_uds_package.sh first." >&2
    exit 1
fi

BUNDLE_FILE="$(python3 -c "import json; print(json.load(open('${MANIFEST}'))['uds_bundle'])")"
ZARF_FILE="$(python3 -c "import json; print(json.load(open('${MANIFEST}'))['zarf_package'])")"
VERSION="$(python3 -c "import json; print(json.load(open('${MANIFEST}'))['bundle_version'])")"

BUNDLE_PATH="${PACKAGE_DIR}/${BUNDLE_FILE}"
ZARF_PATH="${PACKAGE_DIR}/${ZARF_FILE}"

command_exists() { command -v "$1" >/dev/null 2>&1; }
require() { command_exists "$1" || { echo "'$1' not found." >&2; exit 1; }; }
require uds

if [ "${PUBLISH_BUNDLE}" -eq 1 ]; then
    OCI_BUNDLE_REF="${OCI_BUNDLE_REF:-${GHCR_BUNDLE_REF:-}}"
    if [ -z "${OCI_BUNDLE_REF}" ]; then
        echo "ERROR: set OCI_BUNDLE_REF (e.g. oci://ghcr.io/myorg/uds-bundles/tacvoice:${VERSION})" >&2
        exit 1
    fi
    if [ ! -f "${BUNDLE_PATH}" ]; then
        echo "ERROR: bundle not found: ${BUNDLE_PATH}" >&2
        exit 1
    fi
    echo "Publishing bundle ${BUNDLE_FILE} -> ${OCI_BUNDLE_REF}"
    uds publish "${BUNDLE_PATH}" "${OCI_BUNDLE_REF}" \
        --tmpdir "${TMPDIR}" --uds-cache "${UDS_CACHE}"
fi

if [ "${PUBLISH_ZARF}" -eq 1 ]; then
    OCI_ZARF_REF="${OCI_ZARF_REF:-${GHCR_ZARF_REF:-}}"
    if [ -z "${OCI_ZARF_REF}" ]; then
        echo "ERROR: set OCI_ZARF_REF (e.g. oci://ghcr.io/myorg/uds-packages/tacvoice:${VERSION})" >&2
        exit 1
    fi
    if [ ! -f "${ZARF_PATH}" ]; then
        echo "ERROR: zarf package not found: ${ZARF_PATH}" >&2
        exit 1
    fi
    echo "Publishing Zarf package ${ZARF_FILE} -> ${OCI_ZARF_REF}"
    uds zarf package publish "${ZARF_PATH}" "${OCI_ZARF_REF}" \
        --tmpdir "${TMPDIR}" --zarf-cache "${UDS_CACHE}"
fi

echo "Publish complete."
