#!/usr/bin/env bash
set -euo pipefail

# Deploy TacVoice app tier: transcriber and recognizer must run before tacvoice-service
# (the web/gateway binary dials them over mTLS per tacvoice_policy.xml).

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${PROJECT_ROOT}"

APP_BINS=(transcriber recognizer tacvoice)
APP_NAMES=("TranscriberService" "RecognizerService" "TacVoiceService")

# Match only the service binary, not "tail -f .../tacvoice.log" from a prior deploy.
remote_pgrep() {
    local bin="$1"
    ssh ztxs "pgrep -f '/home/ztxs/${bin}\$' >/dev/null 2>&1"
}

remote_pkill() {
    local sig="$1"
    local bin="$2"
    ssh ztxs "pkill -${sig} -f '/home/ztxs/${bin}\$' 2>/dev/null || true"
}

stop_remote_app() {
    local bin="$1"
    echo "  stopping ${bin}..."
    remote_pkill TERM "${bin}"
    for _ in 1 2 3 4 5; do
        if ! remote_pgrep "${bin}"; then
            echo "  ${bin} stopped"
            return 0
        fi
        sleep 1
        remote_pkill KILL "${bin}"
    done
    echo "WARNING: could not stop remote ${bin}; continuing deploy" >&2
    ssh ztxs "pgrep -af '/home/ztxs/${bin}'" >&2 || true
}

wait_for_log_line() {
    local log="$1"
    local pattern="$2"
    local timeout="${3:-15}"
    local label="${4:-startup}"
    echo -n "  waiting for ${label}"
    for _ in $(seq 1 "${timeout}"); do
        if ssh ztxs "grep -q '${pattern}' '${log}' 2>/dev/null"; then
            echo " ok"
            return 0
        fi
        echo -n "."
        sleep 1
    done
    echo " timed out"
    return 1
}

require_remote_keyservice() {
    echo "Checking remote KeyService (tvks on port 31010)..."
    if ! ssh ztxs "pgrep -f '/home/ztxs/tvks\$' >/dev/null 2>&1"; then
        echo "ERROR: tvks (KeyService) is not running on ztxs." >&2
        print_ztxs_prereq >&2
        return 1
    fi
    if ssh ztxs "ss -ltn 2>/dev/null | grep -q ':31010 '" || \
       ssh ztxs "netstat -ltn 2>/dev/null | grep -q ':31010 '"; then
        echo "  KeyService is listening on port 31010"
        return 0
    fi
    echo "ERROR: tvks is running but port 31010 is not listening." >&2
    echo "  Check /home/ztxs/tvks.log on the remote host." >&2
    print_ztxs_prereq >&2
    return 1
}

print_ztxs_prereq() {
    echo "" >&2
    echo "TacVoiceService requires ZTXS infrastructure (KeyService first)." >&2
    echo "Deploy the ZTXS tier, then re-run this script:" >&2
    echo "  ${SCRIPT_DIR}/deploy_ztxs.sh" >&2
    echo "  ${SCRIPT_DIR}/deploy_tacvoice.sh" >&2
}

"${SCRIPT_DIR}/build_tacvoice.sh"
wait

echo "Stopping remote TacVoice app processes..."
for bin in "${APP_BINS[@]}"; do
    stop_remote_app "${bin}"
done
wait

for bin in "${APP_BINS[@]}"; do
    ssh ztxs "rm -f /home/ztxs/${bin} /home/ztxs/${bin}.log"
done
wait

for bin in "${APP_BINS[@]}"; do
    echo "Uploading ${bin}..."
    scp -rpi ~/.ssh/id_ed25519 -P 6040 "${PROJECT_ROOT}/target/release/${bin}" ztxs:/home/ztxs/
    ssh ztxs "chmod +x /home/ztxs/${bin}"
done
wait

for i in "${!APP_BINS[@]}"; do
    bin="${APP_BINS[$i]}"
    name="${APP_NAMES[$i]}"
    log="/home/ztxs/${bin}.log"
    case "${bin}" in
        transcriber) ok_pattern="TranscriberService started on" ;;
        recognizer) ok_pattern="RecognizerService started on" ;;
        tacvoice) ok_pattern="Message catalog loaded from msgrepo" ;;
        *) ok_pattern="started successfully" ;;
    esac
    echo "Starting ${name} (${bin})..."
    if [ "${bin}" = "tacvoice" ] && ! require_remote_keyservice; then
        exit 1
    fi
    # ssh -n + /dev/null stdin: avoid SSH waiting on the backgrounded service process.
    ssh -n ztxs "truncate -s 0 '${log}' 2>/dev/null || : > '${log}'; nohup /home/ztxs/${bin} >> '${log}' 2>&1 < /dev/null &"
    if ! wait_for_log_line "${log}" "${ok_pattern}" 30 "${name}"; then
        echo "ERROR: ${name} did not report successful startup" >&2
        ssh ztxs "tail -30 '${log}'" >&2 || true
        exit 1
    fi
    REMOTE_PID="$(ssh ztxs "pgrep -n -f '/home/ztxs/${bin}\$'" 2>/dev/null || echo "")"
    if [ -n "${REMOTE_PID}" ]; then
        echo "${name} remote PID: ${REMOTE_PID}"
    else
        echo "WARNING: ${name} log looks healthy but pgrep found no PID" >&2
    fi
done

if ssh ztxs "grep -q 'Fatal error' /home/ztxs/tacvoice.log 2>/dev/null"; then
    echo "ERROR: tacvoice reported a fatal error during startup" >&2
    ssh ztxs "tail -30 /home/ztxs/tacvoice.log" >&2
    exit 1
fi

echo ""
echo "Waiting for Vosk model preload (may take several minutes)..."
if ! wait_for_log_line "/home/ztxs/tacvoice.log" "Uploaded: vosk/vosk-model.tar.gz" 600 "Vosk preload"; then
    echo "ERROR: tacvoice did not finish Vosk preload" >&2
    ssh ztxs "tail -30 /home/ztxs/tacvoice.log" >&2 || true
    exit 1
fi
if ssh ztxs "grep -q 'background upload_assets failed' /home/ztxs/tacvoice.log 2>/dev/null"; then
    echo "ERROR: tacvoice asset preload failed" >&2
    ssh ztxs "tail -30 /home/ztxs/tacvoice.log" >&2 || true
    exit 1
fi

echo ""
echo "TacVoice app tier deployed successfully."
echo "  transcriber, recognizer, tacvoice running on ztxs"
echo "  tail log: ssh ztxs 'tail -f /home/ztxs/tacvoice.log'"
