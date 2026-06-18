#!/usr/bin/env bash
set -euo pipefail

# Audit install/runtime scripts for /tmp and root-fs scratch usage.
# Exit 0 when no bare /tmp references remain in tracked scripts; exit 1 on hits.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

# shellcheck source=scratch_dirs.sh
source "${SCRIPT_DIR}/scratch_dirs.sh"
scratch_dirs_init

echo "Configured scratch (repo-local):"
echo "  TMPDIR=${TMPDIR}"
echo "  UDS_CACHE=${UDS_CACHE}"
echo ""

FAIL=0

echo "=== Scripts referencing bare /tmp (excluding audit + 'never /tmp' comments) ==="
while IFS= read -r hit; do
    [ -z "${hit}" ] && continue
    echo "  ${hit}"
    FAIL=1
done < <(rg -n '(/tmp\b|"/tmp)' "${REPO_ROOT}" \
    --glob '*.sh' --glob 'uds/tasks.yaml' \
    --glob '!**/target/**' \
    --glob '!service/scripts/verify_scratch.sh' \
    | rg -v 'never /tmp|not /tmp|off the quota|#.*(/tmp)' || true)

if [ "${FAIL}" -eq 0 ]; then
    echo "  (none)"
fi
echo ""

echo "=== Scripts that should call scratch_dirs_init ==="
for f in \
    "${SCRIPT_DIR}/install_uds.sh" \
    "${SCRIPT_DIR}/build_uds_package.sh" \
    "${SCRIPT_DIR}/publish_uds_package.sh" \
    "${SCRIPT_DIR}/tacvoice_up.sh" \
    "${SCRIPT_DIR}/tacvoice_down.sh" \
    "${SCRIPT_DIR}/remove_uds.sh" \
    "${REPO_ROOT}/uds/install_uds_core.sh" \
    "${REPO_ROOT}/uds/remove_uds_core.sh" \
    "${REPO_ROOT}/uds/host_gateway.sh" \
    "${REPO_ROOT}/uds/install_k3d.sh"; do
    if [ -f "${f}" ] && rg -q 'scratch_dirs_init' "${f}"; then
        echo "  OK $(realpath --relative-to="${REPO_ROOT}" "${f}")"
    elif [ -f "${f}" ]; then
        echo "  MISSING scratch_dirs_init in $(realpath --relative-to="${REPO_ROOT}" "${f}")"
        FAIL=1
    fi
done
echo ""

echo "=== UDS/Zarf invocations without scratch flags in the same file ==="
for f in $(rg -l 'uds (zarf package (create|deploy|remove)|deploy |remove )' "${REPO_ROOT}" \
    --glob '*.sh' --glob 'uds/tasks.yaml' 2>/dev/null || true); do
    if rg -q 'uds (zarf package (create|deploy|remove)|deploy |remove )' "${f}" \
        && ! rg -q '\-\-tmpdir' "${f}"; then
        echo "  ${f} (missing --tmpdir)"
        FAIL=1
    elif rg -q 'uds zarf ' "${f}" && ! rg -q '\-\-zarf-cache' "${f}"; then
        echo "  ${f} (uds zarf missing --zarf-cache)"
        FAIL=1
    elif rg -q 'uds (deploy |remove |create )' "${f}" && ! rg -q '\-\-uds-cache' "${f}"; then
        echo "  ${f} (uds command missing --uds-cache)"
        FAIL=1
    fi
done
if [ "${FAIL}" -eq 0 ]; then
    echo "  (none)"
fi
echo ""

echo "=== External storage (not controlled by these scripts) ==="
echo "  Docker build/pull layers use data-root in /etc/docker/daemon.json (setup_docker_data_root.sh)."
echo "  Cargo registry cache defaults to ~/.cargo unless CARGO_HOME is set."
echo "  k3d cluster state uses Docker volumes (k3d-uds-images, etc.)."
echo ""

if [ "${FAIL}" -eq 0 ]; then
    echo "Scratch audit passed."
else
    echo "Scratch audit found issues." >&2
    exit 1
fi
