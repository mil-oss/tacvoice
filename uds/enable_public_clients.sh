#!/usr/bin/env bash
# Enable UDS Operator admission for non-device-flow PKCE public SSO clients.
# Required for TacVoice's browser Authorization Code + PKCE client (uds-tac-tacvoice).
set -euo pipefail

NS="${UDS_OPERATOR_CONFIG_NS:-pepr-system}"
SECRET="${UDS_OPERATOR_CONFIG_SECRET:-uds-operator-config}"

command_exists() { command -v "$1" >/dev/null 2>&1; }
if ! command_exists uds; then
    echo "uds CLI not found." >&2
    exit 1
fi

echo "Setting ALLOW_PUBLIC_CLIENTS=true on ${NS}/${SECRET}..."
uds zarf tools kubectl patch secret "${SECRET}" -n "${NS}" --type merge \
    -p '{"stringData":{"ALLOW_PUBLIC_CLIENTS":"true"}}'

echo "Restarting Pepr to pick up operator config..."
uds zarf tools kubectl rollout restart deployment/pepr-uds-core -n "${NS}" 2>/dev/null \
    || uds zarf tools kubectl delete pod -n "${NS}" -l app.kubernetes.io/name=pepr --wait=false 2>/dev/null \
    || true

uds zarf tools kubectl rollout status deployment/pepr-uds-core -n "${NS}" --timeout=120s 2>/dev/null \
    || echo "Note: wait for Pepr pods to become Ready before redeploying TacVoice."

echo "ALLOW_PUBLIC_CLIENTS enabled."
