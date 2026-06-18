#!/usr/bin/env bash
# Relocate Docker Engine storage off / via /etc/docker/daemon.json (no Desktop UI).
set -euo pipefail

DOCKER_DATA_ROOT="${DOCKER_DATA_ROOT:-/mnt/HARDONE/docker}"
DAEMON_JSON="/etc/docker/daemon.json"
OLD_ROOT="/var/lib/docker"

_as_root() {
    [ "$(id -u)" -eq 0 ] || exec sudo env DOCKER_DATA_ROOT="${DOCKER_DATA_ROOT}" bash "$0" "$@"
}

running="$(docker info -f '{{.DockerRootDir}}' 2>/dev/null || true)"
if [ "${running}" = "${DOCKER_DATA_ROOT}" ]; then
    echo "Docker data-root already ${DOCKER_DATA_ROOT}."
    exit 0
fi

echo "Relocating Docker data-root: ${OLD_ROOT} -> ${DOCKER_DATA_ROOT}"
_as_root

systemctl stop docker docker.socket 2>/dev/null || true

mkdir -p "${DOCKER_DATA_ROOT}"
if [ -d "${OLD_ROOT}" ] && [ -n "$(ls -A "${OLD_ROOT}" 2>/dev/null)" ]; then
    echo "Migrating existing data to ${DOCKER_DATA_ROOT}..."
    rsync -a "${OLD_ROOT}/" "${DOCKER_DATA_ROOT}/"
fi

mkdir -p "$(dirname "${DAEMON_JSON}")"
if [ -f "${DAEMON_JSON}" ]; then
    python3 -c "
import json
with open('${DAEMON_JSON}') as f:
    cfg = json.load(f)
cfg['data-root'] = '${DOCKER_DATA_ROOT}'
with open('${DAEMON_JSON}', 'w') as f:
    json.dump(cfg, f, indent=2)
    f.write('\n')
"
else
    cat >"${DAEMON_JSON}" <<EOF
{
  "data-root": "${DOCKER_DATA_ROOT}"
}
EOF
fi

systemctl start docker

actual="$(docker info -f '{{.DockerRootDir}}' 2>/dev/null || true)"
if [ "${actual}" != "${DOCKER_DATA_ROOT}" ]; then
    echo "ERROR: expected Docker Root Dir ${DOCKER_DATA_ROOT}, got ${actual:-<unknown>}" >&2
    exit 1
fi

echo "Docker data-root is now ${DOCKER_DATA_ROOT} (${DAEMON_JSON})."
