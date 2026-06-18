#!/usr/bin/env bash
# Ensures the docker CLI talks to Docker Engine, not legacy rootless Podman.
# Source from other scripts:  source uds/setup_docker.sh
# Or run directly:            uds/setup_docker.sh

_setup_docker() {
    # Old setup_podman_docker.sh exported these in ~/.bashrc; they hijack the CLI.
    if [[ "${DOCKER_HOST:-}" == *podman* ]]; then
        unset DOCKER_HOST DOCKER_SOCK
        echo "NOTE: Ignoring Podman DOCKER_HOST; using Docker Engine socket." >&2
    fi

    local bashrc="${HOME}/.bashrc"
    if [ -f "${bashrc}" ] && grep -qF 'tacvoice: podman docker-compat' "${bashrc}" 2>/dev/null; then
        echo "Removing legacy Podman exports from ${bashrc}..."
        sed -i '/tacvoice: podman docker-compat/,+2d' "${bashrc}"
    fi

    if ! command -v docker >/dev/null 2>&1; then
        echo "ERROR: docker CLI not found." >&2
        echo "Install Docker Engine: https://docs.docker.com/engine/install/" >&2
        return 1
    fi

    if ! docker info >/dev/null 2>&1; then
        echo "ERROR: Docker daemon not reachable at /var/run/docker.sock." >&2
        echo "Start docker: sudo systemctl start docker" >&2
        echo "If permission denied, add your user to the docker group:" >&2
        echo "  sudo usermod -aG docker \$USER && newgrp docker" >&2
        return 1
    fi

    local server_ver
    server_ver="$(docker version -f '{{.Server.Version}}' 2>/dev/null || true)"
    # Podman mimics the docker API and reports low 5.x server versions.
    if [[ "${server_ver}" =~ ^[0-5]\. ]]; then
        echo "ERROR: docker is still connected to Podman (server ${server_ver}), not Docker Engine." >&2
        echo "Open a new shell after setup_docker.sh cleaned ~/.bashrc, or run:" >&2
        echo "  unset DOCKER_HOST DOCKER_SOCK" >&2
        return 1
    fi

    echo "Docker Engine OK (server ${server_ver})."
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    set -euo pipefail
    _setup_docker
else
    _setup_docker || return 1
fi
