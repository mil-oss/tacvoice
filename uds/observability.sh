#!/usr/bin/env bash
set -euo pipefail

# Access helper for the UDS Monitoring & Observability stack on local k3d.
# Grafana, Prometheus, and Loki are on the admin gateway (*.admin.uds.dev).
# Ref: doc/llms-full.txt — Monitoring & Observability, Logging.

UDS_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "${UDS_DIR}/.." && pwd)"
TACVOICE_NS="${TACVOICE_NS:-tacvoice}"

# shellcheck source=service/scripts/scratch_dirs.sh
source "${REPO_ROOT}/service/scripts/scratch_dirs.sh"
scratch_dirs_init

ADMIN_PF_PORT="${UDS_ADMIN_GATEWAY_PORT:-19443}"
PF_PID_FILE="${TMPDIR}/uds-admin-gateway.pid"
PF_LOG="${TMPDIR}/uds-admin-gateway.log"
GRAFANA_URL="https://grafana.admin.uds.dev"
KEYCLOAK_ADMIN_URL="https://keycloak.admin.uds.dev"

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

observability_ready() {
    uds zarf tools kubectl get ns grafana >/dev/null 2>&1 \
        && uds zarf tools kubectl get ns monitoring >/dev/null 2>&1
}

admin_https_code() {
    local host="$1"
    curl -sk -o /dev/null -w '%{http_code}' --max-time 5 "https://${host}/" 2>/dev/null || echo 000
}

print_urls() {
    cat <<EOF
UDS Monitoring & Observability (local k3d)

  Grafana (metrics + logs):  ${GRAFANA_URL}
  Keycloak admin:            ${KEYCLOAK_ADMIN_URL}

Login: Keycloak SSO. Use a user in /UDS Core/Admin or /UDS Core/Auditor.
Dev-only default (if created): doug / unicorn123!@#

Grafana — Explore → Prometheus (TacVoice / mesh):
  probe_success{namespace="${TACVOICE_NS}"}
  kube_pod_container_status_restarts_total{namespace="${TACVOICE_NS}"}
  sum(rate(istio_requests_total{destination_service_namespace="${TACVOICE_NS}"}[5m])) by (destination_service_name)

Grafana — Explore → Loki (TacVoice container logs):
  {namespace="${TACVOICE_NS}"}
  {namespace="${TACVOICE_NS}", container="tacvoice"} |= "error"
  {namespace="${TACVOICE_NS}", container=~"transcriber|recognizer"}

Dashboards: UDS / Monitoring / Probe Uptime, Core Uptime, Istio dashboards.

kubectl (no Grafana):
  uds zarf tools kubectl get pods -n ${TACVOICE_NS}
  uds zarf tools kubectl logs -n ${TACVOICE_NS} deploy/tacvoice -c tacvoice --tail=100
  uds zarf tools kubectl get package -n ${TACVOICE_NS}

EOF
}

diag() {
    local grafana_code kc_code
    if ! observability_ready; then
        echo "observability=missing (run: ${UDS_DIR}/install_uds_observability.sh)"
        return 1
    fi
    echo "observability=installed"
    uds zarf tools kubectl get pods -n grafana --no-headers 2>/dev/null | head -3 || true
    uds zarf tools kubectl get pods -n monitoring --no-headers 2>/dev/null | head -3 || true
    grafana_code="$(admin_https_code grafana.admin.uds.dev)"
    kc_code="$(admin_https_code keycloak.admin.uds.dev)"
    echo "grafana.admin.uds.dev_https=${grafana_code}"
    echo "keycloak.admin.uds.dev_https=${kc_code}"
    if [ "${grafana_code}" = "200" ] || [ "${grafana_code}" = "302" ]; then
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
    uds zarf tools kubectl port-forward -n istio-admin-gateway \
        svc/admin-ingressgateway "${ADMIN_PF_PORT}:443" >>"${PF_LOG}" 2>&1 &
    echo $! >"${PF_PID_FILE}"
    sleep 2
    if ! kill -0 "$(cat "${PF_PID_FILE}")" 2>/dev/null; then
        echo "admin port-forward failed; see ${PF_LOG}" >&2
        exit 1
    fi
    local code
    code="$(curl -sk -o /dev/null -w '%{http_code}' --max-time 5 \
        --resolve "grafana.admin.uds.dev:${ADMIN_PF_PORT}:127.0.0.1" \
        "https://grafana.admin.uds.dev:${ADMIN_PF_PORT}/" 2>/dev/null || echo 000)"
    echo "Admin gateway forward:"
    echo "  ${GRAFANA_URL}:${ADMIN_PF_PORT}/"
    echo "  ${KEYCLOAK_ADMIN_URL}:${ADMIN_PF_PORT}/"
    echo "PID $(cat "${PF_PID_FILE}") (log: ${PF_LOG}) probe_http=${code}"
}

verify() {
    if ! observability_ready; then
        echo "ERROR: monitoring namespaces missing; run install_uds_observability.sh" >&2
        exit 1
    fi
    if ! uds zarf tools kubectl get package tacvoice -n "${TACVOICE_NS}" >/dev/null 2>&1; then
        echo "WARN: tacvoice Package CR not found in ${TACVOICE_NS}" >&2
    else
        phase="$(uds zarf tools kubectl get package tacvoice -n "${TACVOICE_NS}" \
            -o jsonpath='{.status.phase}' 2>/dev/null || true)"
        echo "tacvoice package phase: ${phase:-<none>}"
    fi
    echo "PASS observability namespaces present"
}

usage() {
    cat <<EOF
Usage: $(basename "$0") <command>

Commands:
  urls     Print Grafana/Loki/PromQL access and sample queries
  diag     Check observability stack and admin HTTPS reachability
  verify   Assert monitoring namespaces exist (post-deploy smoke)
  start    Port-forward admin gateway to localhost:${ADMIN_PF_PORT}
  stop     Stop the admin gateway port-forward
  status   Show whether the admin port-forward is running

See uds/docs/observability.md for the full guide.

EOF
}

case "${1:-}" in
    urls) print_urls ;;
    diag)
        if diag; then
            echo "Admin edge OK (or use: $(basename "$0") start)"
        else
            echo "Admin edge not ready; try: $(basename "$0") start" >&2
            exit 1
        fi
        ;;
    verify) verify ;;
    start) start_forward ;;
    stop) stop_forward ;;
    status)
        if [ -f "${PF_PID_FILE}" ] && kill -0 "$(cat "${PF_PID_FILE}")" 2>/dev/null; then
            echo "running pid=$(cat "${PF_PID_FILE}") port=${ADMIN_PF_PORT}"
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
