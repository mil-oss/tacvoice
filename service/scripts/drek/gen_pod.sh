#!/usr/bin/env bash
set -euo pipefail

# Generates a single-Pod manifest running all 10 TacVoice binaries from one image.
# Every container shares the Pod's localhost network namespace, so the existing
# loopback (0.0.0.0 -> 127.0.0.1) policy addressing needs no per-IP changes.
#
# Container ports below mirror the server ports in:
#   service/assets/xml/inst/tacvoice/tacvoice_policy.xml
# tvks (KeyService) is a native sidecar (restartPolicy: Always initContainer) so
# it starts and stays ready before the dependent containers; the others rely on
# their built-in ping/retry logic to converge.

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SERVICE_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
OUT_DIR="${SERVICE_ROOT}/k8s"
OUT_FILE="${OUT_DIR}/tacvoice-pod.yaml"
IMAGE="${TACVOICE_IMAGE:-localhost/tacvoice:latest}"

mkdir -p "${OUT_DIR}"

# name:port for the regular (non-sidecar) containers.
CONTAINERS=(
    "tvps:31020"
    "tvfs:31030"
    "tvws:31040"
    "tvls:31050"
    "msgrepo:31060"
    "voicerepo:31070"
    "transcriber:31150"
    "recognizer:31160"
    "tacvoice:4443"
)

{
    cat <<YAML
apiVersion: v1
kind: Pod
metadata:
  name: tacvoice
  labels:
    app: tacvoice
spec:
  restartPolicy: Always
  initContainers:
    - name: tvks
      image: ${IMAGE}
      imagePullPolicy: Never
      restartPolicy: Always
      command: ["/usr/local/bin/tvks"]
      ports:
        - containerPort: 31010
  containers:
YAML

    for entry in "${CONTAINERS[@]}"; do
        name="${entry%%:*}"
        port="${entry##*:}"
        if [[ "${name}" == "tacvoice" ]]; then
            cat <<YAML
    - name: ${name}
      image: ${IMAGE}
      imagePullPolicy: Never
      command: ["/usr/local/bin/${name}"]
      ports:
        - containerPort: ${port}
      startupProbe:
        tcpSocket:
          port: ${port}
        periodSeconds: 5
        failureThreshold: 60
      readinessProbe:
        tcpSocket:
          port: ${port}
        periodSeconds: 10
YAML
        else
            cat <<YAML
    - name: ${name}
      image: ${IMAGE}
      imagePullPolicy: Never
      command: ["/usr/local/bin/${name}"]
      ports:
        - containerPort: ${port}
YAML
        fi
    done
} >"${OUT_FILE}"

echo "Wrote ${OUT_FILE} (image: ${IMAGE})"
