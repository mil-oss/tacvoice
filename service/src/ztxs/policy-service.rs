use zt_services::structures::*;
use zt_services::client_service::{config_map,init_key_client};
use zt_strcts::policy_strct::PolicyType;
use ztlb::policy::PolicyOps;
use tacvoice::config::*;
use tacvoice::policy::peer_allowlist;
use tacvoice::embed::{get_tacvoice_policy_data, init_mtls_identity};  
use std::collections::HashMap;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    init_mtls_identity()?;
    println!("Starting PolicyService");
    let _policy_server = start_policy_service().await?;

    println!("PolicyService started successfully");

    // Keep the service running
    tokio::signal::ctrl_c().await?;
    println!("Shutting down PolicyService");

    Ok(())
}

/// Start the Policy Service
async fn start_policy_service() -> Result<PolicyServer, Box<dyn std::error::Error>> {
    let policy_xml = get_tacvoice_policy_data()?;
    let policy = PolicyType::load(
        std::str::from_utf8(&policy_xml)
            .map_err(|e| format!("Failed to parse policy XML: {}", e))?,
    );
    let cfg_map = config_map(policy.clone());
    let key_client = init_key_client(policy.clone(), 
    KEY_CLIENT.to_string(),KEY_SERVER.to_string(),KEY_SERVICE.to_string(),KEY_SERVER.to_string()).await?;
    let client_service = ClientService::new(cfg_map.clone(), key_client.clone()).await;
    
    // Get FileClient
    let file_client = client_service
        .get_file_client(
            FILE_CLIENT.to_string(),
            FILE_SERVICE.to_string(),
        )
        .await
        .map_err(|e| format!("Failed to get file client: {}", e))?;

    // Get OrderwireClient
    let orderwire_client = client_service
        .get_orderwire_client(
            ORDERWIRE_CLIENT.to_string(),
            ORDERWIRE_SERVICE.to_string(),
        )
        .await
        .map_err(|e| format!("Failed to get orderwire client: {}", e))?;
    
    // Get service configs
    let policy_service_cfg = cfg_map.get(POLICY_SERVICE).ok_or("PolicyService config not found")?;
    let policy_service_ip = policy_service_cfg.ip_address_text.as_ref().ok_or("PolicyService IP not configured")?;
    let policy_service_port = policy_service_cfg.service_port_numeric.ok_or("PolicyService port not configured")?;
    let attestation_key = policy_service_cfg
        .key_name_text
        .clone()
        .ok_or("Policy attestation key not configured")?;

    // Build allowed addresses for policy server (clients that can connect)

    let allowed_addresses = peer_allowlist(
        &cfg_map,
        &[
            POLICY_CLIENT,
            TACVOICE_POLICY_CLIENT,
        ],
    )?;

    // Create MtlsInterface for policy server
    let policy_interface = MtlsInterface::new(
        POLICY_SERVICE.to_string(),
        (policy_service_ip.clone(), policy_service_port),
        allowed_addresses,
    );

    // Load embedded policies - parse XML then serialize to MessagePack for storage
    let mut policies = HashMap::new();
    let serialized = policy
        .to_vec()
        .map_err(|e| format!("Failed to serialize tacvoice_policy: {}", e))?;
    policies.insert("tacvoice_policy".to_string(), serialized);
    // Create and start policy server
    let mut policy_server = PolicyServer::new(
        POLICY_SERVICE.to_string(),
        policy_interface,
        file_client,
        orderwire_client,
        key_client,
        attestation_key,
        policies,
    );

    policy_server.start_interface().await?;
    println!("PolicyService started on {}:{}", policy_service_ip, policy_service_port);

    Ok(policy_server)
}
