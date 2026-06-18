#!/usr/bin/env bash
set -euo pipefail

# Build distributable TacVoice UDS artifacts into uds_package/ (no cluster required).
# Produces: Zarf package, app-only UDS bundle, SBOM, manifest.json, checksums.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SERVICE_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
REPO_ROOT="$(cd "${SERVICE_ROOT}/.." && pwd)"
UDS_DIR="${REPO_ROOT}/uds"

# shellcheck source=scratch_dirs.sh
source "${SCRIPT_DIR}/scratch_dirs.sh"
scratch_dirs_init

# shellcheck source=uds/setup_docker.sh
source "${UDS_DIR}/setup_docker.sh"

OUTPUT_DIR="${REPO_ROOT}/uds_package"
SKIP_DOCKER=0
ZARF_VERSION="0.1.0-uds.0"
BUNDLE_VERSION="0.1.0"

usage() {
    echo "Usage: $0 [--skip-docker] [--output DIR]" >&2
    exit 1
}

while [ $# -gt 0 ]; do
    case "$1" in
        --skip-docker) SKIP_DOCKER=1; shift ;;
        --output) OUTPUT_DIR="$2"; shift 2 ;;
        -h|--help) usage ;;
        *) echo "Unknown option: $1" >&2; usage ;;
    esac
done

command_exists() { command -v "$1" >/dev/null 2>&1; }
require() { command_exists "$1" || { echo "'$1' not found." >&2; exit 1; }; }

require uds
require docker

BUILD_CONTEXT="$(cd "${REPO_ROOT}/.." && pwd)"
CONTAINERFILE="${REPO_ROOT}/Containerfile"
IGNOREFILE="${REPO_ROOT}/.containerignore"
IMAGE="${TACVOICE_IMAGE:-localhost/tacvoice:latest}"
TACVOICE_TAG="${TACVOICE_TAG:-}"
REGISTRY_IMAGE="${TACVOICE_REGISTRY_IMAGE:-}"

ensure_registry() {
    if docker ps -a --format '{{.Names}}' | grep -qx tacvoice-registry; then
        docker start tacvoice-registry >/dev/null 2>&1 || true
    else
        docker run -d -p 5000:5000 --name tacvoice-registry registry:2 >/dev/null
    fi
    local ready=0
    for _ in $(seq 1 30); do
        if curl -sf http://127.0.0.1:5000/v2/ >/dev/null 2>&1; then
            ready=1
            break
        fi
        sleep 1
    done
    if [ "${ready}" -ne 1 ]; then
        echo "ERROR: localhost:5000 registry not ready after 30s." >&2
        docker logs tacvoice-registry 2>&1 | tail -20 >&2 || true
        exit 1
    fi
}

if [ "${SKIP_DOCKER}" -eq 0 ]; then
    require wasm-pack
    echo "Building WASM client (pre-docker)..."
    "${SERVICE_ROOT}/scripts/build_wasm.sh"
    WASM_PKG="${REPO_ROOT}/service/assets/www/js/pkg/tacvoice_bg.wasm"
    if [ ! -f "${WASM_PKG}" ]; then
        echo "ERROR: ${WASM_PKG} missing after build_wasm.sh." >&2
        exit 1
    fi

    echo "Building image ${IMAGE} (context: ${BUILD_CONTEXT})..."
    cp "${IGNOREFILE}" "${BUILD_CONTEXT}/.dockerignore"
    docker build -f "${CONTAINERFILE}" -t "${IMAGE}" "${BUILD_CONTEXT}"
else
    echo "Skipping docker build (--skip-docker)."
    if ! docker image inspect "${IMAGE}" >/dev/null 2>&1; then
        echo "ERROR: image ${IMAGE} not found locally; remove --skip-docker." >&2
        exit 1
    fi
fi

if [ -z "${TACVOICE_TAG}" ]; then
    TACVOICE_TAG="$(docker image inspect "${IMAGE}" --format '{{.Id}}' | sed 's/^sha256://' | cut -c1-12)"
fi
IMAGE_DIGEST="$(docker image inspect "${IMAGE}" --format '{{.Id}}' | sed 's/^sha256://')"
REGISTRY_IMAGE="${REGISTRY_IMAGE:-localhost:5000/tacvoice:${TACVOICE_TAG}}"
echo "Image tag for package: ${TACVOICE_TAG}"

echo "Starting throwaway localhost:5000 registry for the Zarf hand-off..."
ensure_registry

echo "Pushing ${REGISTRY_IMAGE}..."
docker tag "${IMAGE}" "${REGISTRY_IMAGE}"
docker push "${REGISTRY_IMAGE}"

mkdir -p "${OUTPUT_DIR}"
STAGING="${TMPDIR}/uds-package-staging"
rm -rf "${STAGING}"
mkdir -p "${STAGING}"

cd "${UDS_DIR}"
echo "Creating Zarf package (with SBOM)..."
uds zarf package create . --confirm --set TACVOICE_TAG="${TACVOICE_TAG}" \
    --tmpdir "${TMPDIR}" --zarf-cache "${UDS_CACHE}"

ZARF_PKG="$(ls -t zarf-package-tacvoice-*.tar.zst 2>/dev/null | head -n1)"
if [ -z "${ZARF_PKG}" ]; then
    echo "Zarf package not found after create." >&2
    exit 1
fi
cp -f "${ZARF_PKG}" "${STAGING}/"

echo "Creating app-only UDS bundle..."
cd "${UDS_DIR}/bundle-app"
uds create . --confirm --tmpdir "${TMPDIR}" --uds-cache "${UDS_CACHE}" -o "${STAGING}"

BUNDLE_PKG="$(ls -t "${STAGING}"/uds-bundle-tacvoice-app-*.tar.zst 2>/dev/null | head -n1)"
if [ -z "${BUNDLE_PKG}" ]; then
    echo "UDS app bundle not found after create." >&2
    exit 1
fi

echo "Extracting SBOM..."
SBOM_DIR="${STAGING}/sbom"
mkdir -p "${SBOM_DIR}"
uds zarf package inspect sbom "${UDS_DIR}/${ZARF_PKG}" --output "${SBOM_DIR}" \
    --tmpdir "${TMPDIR}" --zarf-cache "${UDS_CACHE}"

GIT_REF="$(git -C "${REPO_ROOT}" rev-parse --short HEAD 2>/dev/null || echo unknown)"
BUILT_AT="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

MANIFEST="${STAGING}/manifest.json"
cat >"${MANIFEST}" <<EOF
{
  "package": "tacvoice",
  "version": "${ZARF_VERSION}",
  "bundle_version": "${BUNDLE_VERSION}",
  "tacvoice_tag": "${TACVOICE_TAG}",
  "image": "${REGISTRY_IMAGE}",
  "image_digest": "${IMAGE_DIGEST}",
  "zarf_package": "$(basename "${ZARF_PKG}")",
  "uds_bundle": "$(basename "${BUNDLE_PKG}")",
  "built_at": "${BUILT_AT}",
  "git_ref": "${GIT_REF}"
}
EOF

cp -f "${UDS_DIR}/uds-config-app.yaml" "${STAGING}/uds-config-app.yaml"

echo "Writing checksums..."
(
    cd "${STAGING}"
    sha256sum "$(basename "${ZARF_PKG}")" "$(basename "${BUNDLE_PKG}")" manifest.json uds-config-app.yaml \
        > checksums.sha256
)

echo "Installing artifacts to ${OUTPUT_DIR}..."
rm -rf "${OUTPUT_DIR}"
mkdir -p "${OUTPUT_DIR}"
cp -a "${STAGING}/." "${OUTPUT_DIR}/"

echo ""
echo "UDS package build complete:"
echo "  ${OUTPUT_DIR}/$(basename "${ZARF_PKG}")"
echo "  ${OUTPUT_DIR}/$(basename "${BUNDLE_PKG}")"
echo "  ${OUTPUT_DIR}/manifest.json"
echo "  ${OUTPUT_DIR}/sbom/"
echo "Publish: ./service/scripts/publish_uds_package.sh"
