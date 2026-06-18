use zt_services::structures::*;
use zt_services::client_service::{config_map,init_key_client};
use zt_strcts::policy_strct::PolicyType;
use ztlb::policy::PolicyOps;
use tacvoice::config::*;
use tacvoice::policy::peer_allowlist;
use tacvoice::embed::{get_tacvoice_policy_data, init_mtls_identity};  

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    init_mtls_identity()?;
    let _ledger_server = start_ledger_service().await?;

    // Keep the service running
    tokio::signal::ctrl_c().await?;

    Ok(())
}

/// Start the Ledger Service
async fn start_ledger_service() -> Result<LedgerServer, Box<dyn std::error::Error>> {
    // Load policy XML
    let policy_xml = get_tacvoice_policy_data()?;
    let policy = PolicyType::load(std::str::from_utf8(&policy_xml)
        .map_err(|e| format!("Failed to parse policy XML: {}", e))?);
    let cfg_map = config_map(policy.clone());
    let key_client = init_key_client(policy.clone(), 
    KEY_CLIENT.to_string(),KEY_SERVER.to_string(),KEY_SERVICE.to_string(),KEY_SERVER.to_string()).await?;
    let client_service = ClientService::new(cfg_map.clone(), key_client.clone()).await;
    
    // Get OrderwireClient
    let orderwire_client = client_service
        .get_orderwire_client(
            ORDERWIRE_CLIENT.to_string(),
            ORDERWIRE_SERVICE.to_string(),
        )
        .await
        .map_err(|e| format!("Failed to get orderwire client: {}", e))?;
    
    // Get service configs
    let ledger_service_cfg = cfg_map.get(LEDGER_SERVICE).ok_or("LedgerService config not found")?;
    let ledger_service_ip = ledger_service_cfg.ip_address_text.as_ref().ok_or("LedgerService IP not configured")?;
    let ledger_service_port = ledger_service_cfg.service_port_numeric.ok_or("LedgerService port not configured")?;
    let audit_key = ledger_service_cfg
        .key_name_text
        .clone()
        .ok_or("Ledger audit key not configured")?;

   // Build allowed addresses for ledger server (clients that can connect)

    let allowed_addresses = peer_allowlist(
        &cfg_map,
        &[
            LEDGER_CLIENT,
            TACVOICE_LEDGER_CLIENT,
        ],
    )?;

    // Create MtlsInterface for ledger server
    let ledger_interface = MtlsInterface::new(
        LEDGER_SERVICE.to_string(),
        (ledger_service_ip.clone(), ledger_service_port),
        allowed_addresses,
    );

    // Create and start ledger server
    let mut ledger_server = LedgerServer::new(
        LEDGER_SERVICE.to_string(),
        ledger_interface,
        orderwire_client,
        LEDGER_LOCATION.to_string(),
        key_client,
        audit_key,
    );

    ledger_server.start_interface().await?;

    Ok(ledger_server)
}
