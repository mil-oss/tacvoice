#!/usr/bin/env bash
# Redirect host scratch off /tmp and the default ~/.uds-cache.
# Source after REPO_ROOT is set:
#   source "${REPO_ROOT}/service/scripts/scratch_dirs.sh"
#   scratch_dirs_init

scratch_dirs_init() {
    if [ -z "${REPO_ROOT:-}" ]; then
        echo "scratch_dirs_init: REPO_ROOT must be set" >&2
        return 1
    fi
    export TMPDIR="${TMPDIR:-${REPO_ROOT}/temp}"
    export UDS_CACHE="${UDS_CACHE:-${REPO_ROOT}/temp/uds-cache}"
    mkdir -p "${TMPDIR}" "${UDS_CACHE}"
}

# Args for UDS CLI commands (deploy, create, remove).
uds_scratch_args() {
    printf '%s\n%s' "--tmpdir" "${TMPDIR}" "--uds-cache" "${UDS_CACHE}"
}

# Args for `uds zarf ...` (forwards to zarf; uses --zarf-cache, not --uds-cache).
zarf_scratch_args() {
    printf '%s\n%s' "--tmpdir" "${TMPDIR}" "--zarf-cache" "${UDS_CACHE}"
}
