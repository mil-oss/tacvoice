#!/bin/bash
# Deploy ZTXS service binaries to remote server
# ensure ssh config is set up for ${service} and share ssh key
# ssh-copy-id ${service}

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd $PROJECT_ROOT

# Service binaries in dependency order (KeyService must start first)
SERVICES=("tvks" "tvfs" "tvws" "tvls" "tvps" "voicerepo" "msgrepo")
SERVICE_NAMES=("KeyService" "FileService" "OrderwireService" "LedgerService" "PolicyService" "VoiceRepositoryService" "MessageRepositoryService")

echo "Building ZTXS service binaries..."
if ! "${SCRIPT_DIR}/build_ztxs.sh"; then
    echo "ERROR: Build failed. Not deploying services." >&2
    exit 1
fi
wait

# Stop all running service processes
echo "Stopping remote ZTXS services..."
ssh ztxs "pkill -u ztxs"

# Replace and start all service binaries
echo "Uploading service binaries..."
for i in "${!SERVICES[@]}"; do
    service="${SERVICES[$i]}"
    service_name="${SERVICE_NAMES[$i]}"
    echo "Uploading ${service}..."
    ssh ztxs "rm -f /home/ztxs/${service}"
    ssh ztxs "rm -f /home/ztxs/${service}.log" 
    scp -rpi ~/.ssh/id_ed25519 -P 6040 "${PROJECT_ROOT}/target/release/${service}" ztxs:/home/ztxs/
    ssh ztxs "chmod +x /home/ztxs/${service}"
    service_name="${SERVICE_NAMES[$i]}"
    echo "Starting ${service_name} (${service})..."
    # Start service remotely - output streams through SSH connection
    # Service runs and outputs to log file
    ssh ztxs "nohup /home/ztxs/${service} > /home/ztxs/${service}.log 2>&1 &"
    ssh ztxs "tail -f /home/ztxs/${service}.log" &
    SSH_PID=$!
    # Show output for a few seconds
    sleep 3
    # Verify service is running on remote
    REMOTE_PID=$(ssh ztxs "pgrep -f '/home/ztxs/${service}' | head -1" 2>/dev/null || echo "")
    if [ -n "$REMOTE_PID" ]; then
        echo "${service_name} remote PID: ${REMOTE_PID}"
    else
        echo "WARNING: ${service_name} may not have started"
    fi
    # SSH connection continues in background, showing service output
done

echo ""
echo "All services deployed and started"


