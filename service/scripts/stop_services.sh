#!/bin/bash
# Tail all ZTXS service log files from remote hosts.
# Ensure ssh config is set up for each service and share ssh key: ssh-copy-id ${service}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "$PROJECT_ROOT"

# Service binaries in dependency order (KeyService must start first)
SERVICES=("tvks" "tvfs" "tvws" "tvls" "tvps" "voicerepo" "msgrepo")
SERVICE_NAMES=("KeyService" "FileService" "OrderwireService" "LedgerService" "PolicyService" "VoiceRepositoryService" "MessageRepositoryService")


echo "Stopping all services..."
for i in "${!SERVICES[@]}"; do
    service="${SERVICES[$i]}"
    service_name="${SERVICE_NAMES[$i]}"
    (echo "=== ${service_name} (${service}) ===" && ssh ztxs "pkill -TERM  ${service}") &
done
wait
