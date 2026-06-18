#!/usr/bin/env bash
# Post-deploy smoke test for UDS Monitoring & Observability on TacVoice clusters.
set -euo pipefail

UDS_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "[observability] checking UDS monitoring namespaces"
"${UDS_DIR}/observability.sh" verify

echo "[observability] checking Package CR uptime probes"
phase="$(uds zarf tools kubectl get package tacvoice -n tacvoice \
  -o jsonpath='{.status.phase}' 2>/dev/null || true)"
monitors="$(uds zarf tools kubectl get package tacvoice -n tacvoice \
  -o jsonpath='{.status.monitors}' 2>/dev/null || true)"
echo "[observability]   package phase: ${phase:-<none>}"
echo "[observability]   monitors: ${monitors:-<none>}"
if [ "${phase}" != "Ready" ]; then
  echo "[observability] ERROR: Package CR not Ready" >&2
  exit 1
fi

echo "[observability] PASS"
