#!/usr/bin/env bash
set -euo pipefail

# Host-side access helper for uds.dev on local k3d.
# TacVoice and the Istio tenant gateway are healthy in-cluster; this script
# diagnoses broken host routing on 127.0.0.1:443 and optionally starts a
# kubectl port-forward when the k3d edge returns "404 page not found".

UDS_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "${UDS_DIR}/.." && pwd)"

# shellcheck source=service/scripts/scratch_dirs.sh
source "${REPO_ROOT}/service/scripts/scratch_dirs.sh"
scratch_dirs_init

PF_PORT="${UDS_HOST_GATEWAY_PORT:-18443}"
PF_PID_FILE="${TMPDIR}/uds-host-gateway.pid"
PF_LOG="${TMPDIR}/uds-host-gateway.log"

command_exists() { command -v "$1" >/dev/null 2>&1; }

kubeconfig() {
    if [ -n "${KUBECONFIG:-}" ] && uds zarf tools kubectl cluster-info >/dev/null 2>&1; then
        return 0
    fi
    if ! command_exists k3d; then
        echo "k3d not found; set KUBECONFIG to the uds cluster." >&2
        exit 1
    fi
    if ! k3d cluster list 2>/dev/null | awk 'NR>1 {print $1}' | grep -qx uds; then
        echo "k3d cluster 'uds' not found." >&2
        exit 1
    fi
    export KUBECONFIG="$(mktemp "${TMPDIR}/kcfg.XXXX")"
    k3d kubeconfig get uds > "${KUBECONFIG}"
}

diag_host_edge() {
    local code cert host_k3s
    code="$(curl -sk -o /dev/null -w '%{http_code}' --max-time 5 https://tacvoice.uds.dev/ 2>/dev/null || echo 000)"
    cert="$(echo | openssl s_client -connect 127.0.0.1:443 -servername tacvoice.uds.dev 2>/dev/null \
        | openssl x509 -noout -subject 2>/dev/null || true)"
    echo "host_https_code=${code}"
    echo "host_tls_cert=${cert}"
    if command_exists systemctl && systemctl is-active --quiet k3s 2>/dev/null; then
        host_k3s=active
    elif pgrep -f '^traefik traefik ' >/dev/null 2>&1 || ip link show flannel.1 >/dev/null 2>&1; then
        host_k3s=orphans
    else
        host_k3s=inactive
    fi
    echo "host_k3s_service=${host_k3s}"
    if [ "${host_k3s}" != "inactive" ] && echo "${cert}" | grep -q 'TRAEFIK'; then
        echo "hint=host k3s leftovers own :443; run: sudo /usr/local/bin/k3s-killall.sh"
    fi
    if [ "${code}" = "200" ]; then
        return 0
    fi
    return 1
}

stop_forward() {
    if [ -f "${PF_PID_FILE}" ]; then
        local pid
        pid="$(cat "${PF_PID_FILE}")"
        if kill -0 "${pid}" 2>/dev/null; then
            kill "${pid}" 2>/dev/null || true
            wait "${pid}" 2>/dev/null || true
        fi
        rm -f "${PF_PID_FILE}"
    fi
}

start_forward() {
    command_exists uds || { echo "uds CLI not found." >&2; exit 1; }
    kubeconfig
    stop_forward
    uds zarf tools kubectl port-forward -n istio-tenant-gateway \
        svc/tenant-ingressgateway "${PF_PORT}:443" >>"${PF_LOG}" 2>&1 &
    echo $! >"${PF_PID_FILE}"
    sleep 2
    if ! kill -0 "$(cat "${PF_PID_FILE}")" 2>/dev/null; then
        echo "port-forward failed; see ${PF_LOG}" >&2
        exit 1
    fi
    local code
    code="$(curl -sk -o /dev/null -w '%{http_code}' --max-time 5 \
        --resolve "tacvoice.uds.dev:${PF_PORT}:127.0.0.1" \
        "https://tacvoice.uds.dev:${PF_PORT}/" 2>/dev/null || echo 000)"
    if [ "${code}" != "200" ]; then
        echo "port-forward started but probe returned HTTP ${code}; see ${PF_LOG}" >&2
        exit 1
    fi
    echo "Host gateway forward: https://tacvoice.uds.dev:${PF_PORT}/"
    echo "PID $(cat "${PF_PID_FILE}") (log: ${PF_LOG})"
}

usage() {
    cat <<EOF
Usage: $(basename "$0") <command>

Commands:
  diag     Print host edge status (exit 1 when broken)
  start    Start kubectl port-forward on ${PF_PORT} (workaround)
  stop     Stop the port-forward started by this script
  status   Show whether the workaround forward is running

When https://tacvoice.uds.dev/ returns "404 page not found" with a
TRAEFIK DEFAULT CERT on 127.0.0.1:443, an orphaned host k3s install is
usually still holding :443 (Traefik pod + flannel even after systemctl stop).
Clean it up, then retry without the port-forward workaround:

  sudo /usr/local/bin/k3s-killall.sh
  sudo systemctl disable k3s

If the cert is still wrong after that, restart the k3d cluster:

  k3d cluster stop uds && k3d cluster start uds

EOF
}

case "${1:-}" in
    diag)
        if diag_host_edge; then
            echo "Host edge OK: https://tacvoice.uds.dev/"
        else
            echo "Host edge broken; run: $(basename "$0") start" >&2
            exit 1
        fi
        ;;
    start) start_forward ;;
    stop) stop_forward ;;
    status)
        if [ -f "${PF_PID_FILE}" ] && kill -0 "$(cat "${PF_PID_FILE}")" 2>/dev/null; then
            echo "running pid=$(cat "${PF_PID_FILE}") port=${PF_PORT}"
        else
            echo "not running"
        fi
        ;;
    -h|--help|help) usage ;;
    *)
        usage >&2
        exit 1
        ;;
esac
