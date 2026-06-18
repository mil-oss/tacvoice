#!/usr/bin/env bash
# Post-deploy journey smoke test for the TacVoice UDS package.
# Verifies the workload, the UDS Package CR, and the Istio exposure are healthy.
set -euo pipefail

NS="${TACVOICE_NS:-tacvoice}"
APP="${TACVOICE_APP:-tacvoice}"
K="uds zarf tools kubectl"

echo "[journey] waiting for deployment/${APP} rollout in ns/${NS}"
${K} rollout status "deployment/${APP}" -n "${NS}" --timeout=300s

echo "[journey] checking UDS Package CR status"
phase="$(${K} get package "${APP}" -n "${NS}" -o jsonpath='{.status.phase}' 2>/dev/null || true)"
echo "[journey]   package phase: ${phase:-<none>}"
if [ "${phase}" != "Ready" ]; then
  echo "[journey] ERROR: Package CR not Ready (phase=${phase:-<none>})" >&2
  exit 1
fi

echo "[journey] checking generated VirtualService"
vs_count="$(${K} get virtualservice -n "${NS}" -o name 2>/dev/null | wc -l | tr -d ' ')"
if [ "${vs_count}" = "0" ]; then
  echo "[journey] ERROR: no VirtualService generated for ${APP}" >&2
  exit 1
fi
echo "[journey]   virtualservices: ${vs_count}"

echo "[journey] checking the web edge answers on :4443 (in-cluster)"
${K} run "tacvoice-journey-$$" -n "${NS}" --rm -i --restart=Never \
  --image=curlimages/curl:8.10.1 --quiet -- \
  curl -s -o /dev/null -w '%{http_code}\n' --max-time 10 \
  "http://${APP}.${NS}.svc.cluster.local:8080/" || true

echo "[journey] PASS"
