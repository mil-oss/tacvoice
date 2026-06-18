use zt_services::structures::*;
use zt_services::client_service::config_map;
use zt_strcts::policy_strct::PolicyType;
use ztlb::policy::PolicyOps;
use tacvoice::config::*;
use tacvoice::policy::peer_allowlist;
use tacvoice::embed::{get_tacvoice_policy_data, init_mtls_identity};  

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    init_mtls_identity()?;
    println!("Starting OrderwireService");
    let _orderwire_server = start_orderwire_service().await?;

    println!("OrderwireService started successfully");

    // Keep the service running
    tokio::signal::ctrl_c().await?;
    println!("Shutting down OrderwireService");

    Ok(())
}

/// Start the Orderwire Service
async fn start_orderwire_service() -> Result<OrderwireServer, Box<dyn std::error::Error>> {
    // Load policy XML
    let policy_xml = get_tacvoice_policy_data()?;
    let policy = PolicyType::load(std::str::from_utf8(&policy_xml)
        .map_err(|e| format!("Failed to parse policy XML: {}", e))?);
    let cfg_map = config_map(policy.clone());
    let orderwire_service_cfg = cfg_map.get(ORDERWIRE_SERVICE).ok_or("OrderwireService config not found")?;
    let orderwire_service_ip = orderwire_service_cfg.ip_address_text.as_ref().ok_or("OrderwireService IP not configured")?;
    let orderwire_service_port = orderwire_service_cfg.service_port_numeric.ok_or("OrderwireService port not configured")?;

    // Build allowed addresses for orderwire server (clients that can connect)

    let allowed_addresses = peer_allowlist(
        &cfg_map,
        &[
            ORDERWIRE_CLIENT,
            TACVOICE_ORDERWIRE_CLIENT,
            RECEIVER_ORDERWIRE_CLIENT,
        ],
    )?;

    // Create MtlsInterface for orderwire server
    let orderwire_interface = MtlsInterface::new(
        ORDERWIRE_SERVICE.to_string(),
        (orderwire_service_ip.clone(), orderwire_service_port),
        allowed_addresses,
    );

    // Create and start orderwire server
    let mut orderwire_server = OrderwireServer::new_orderwire_interface(
        ORDERWIRE_SERVICE.to_string(),
        orderwire_interface,
    );

    orderwire_server.start_interface().await?;
    println!("OrderwireService started on {}:{}", orderwire_service_ip, orderwire_service_port);

    Ok(orderwire_server)
}
