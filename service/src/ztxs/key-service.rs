use zt_services::client_service::{config_map, provision_attestation_keys};
use zt_services::structures::*;
use zt_strcts::policy_strct::PolicyType;
use ztlb::policy::PolicyOps;
use ztlb::structures::KeyManager;
use tacvoice::config::*;
use tacvoice::policy::peer_allowlist;
use tacvoice::embed::{get_tacvoice_policy_data, init_mtls_identity};  

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    init_mtls_identity()?;
    println!("Starting KeyService");
    let _key_server = start_key_service().await?;

    println!("KeyService started successfully");

    tokio::signal::ctrl_c().await?;
    println!("Shutting down KeyService");

    Ok(())
}

/// Start the Key Service
async fn start_key_service() -> Result<KeyServer, Box<dyn std::error::Error>> {
    let policy_xml = get_tacvoice_policy_data()?;
    let policy = PolicyType::load(
        std::str::from_utf8(&policy_xml)
            .map_err(|e| format!("Failed to parse policy XML: {}", e))?,
    );
    let cfg_map = config_map(policy.clone());

    let mut key_manager = KeyManager::init();
    provision_attestation_keys(&mut key_manager, &policy)?;

    let key_service_cfg = cfg_map
        .get(KEY_SERVICE)
        .ok_or("KeyService config not found")?;
    let key_service_ip = key_service_cfg
        .ip_address_text
        .as_ref()
        .ok_or("KeyService IP not configured")?;
    let key_service_port = key_service_cfg
        .service_port_numeric
        .ok_or("KeyService port not configured")?;

    let allowed_addresses = peer_allowlist(
        &cfg_map,
        &[
            KEY_CLIENT,
            TACVOICE_KEY_CLIENT,
        ],
    )?;

    let key_interface = MtlsInterface::new(
        KEY_SERVICE.to_string(),
        (key_service_ip.to_string(), key_service_port),
        allowed_addresses.clone(),
    );

    let mut key_server = KeyServer::new(
        KEY_SERVICE.to_string(),
        key_interface,
        key_manager,
    );

    key_server.start_interface().await?;
    println!(
        "KeyService started on {}:{}",
        key_service_ip, key_service_port
    );
    println!("Allowed Addresses:");
    for addr in allowed_addresses {
        println!("{}:{}", addr.0, addr.1);
    }

    Ok(key_server)
}
