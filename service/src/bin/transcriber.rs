//! Transcriber binary: standalone tarpc service that publishes browser transcriptions
//! to the Orderwire bus. Boots from the embedded TacVoice policy.

#[cfg(target_arch = "wasm32")]
fn main() {}

#[cfg(not(target_arch = "wasm32"))]
use tacvoice::config::*;
#[cfg(not(target_arch = "wasm32"))]
use tacvoice::embed::{get_tacvoice_policy_data, init_mtls_identity};
#[cfg(not(target_arch = "wasm32"))]
use tacvoice::policy::peer_allowlist;
#[cfg(not(target_arch = "wasm32"))]
use tacvoice::server::structures::TranscriberServer;
#[cfg(not(target_arch = "wasm32"))]
use zt_services::client_service::{config_map, init_key_client};
#[cfg(not(target_arch = "wasm32"))]
use zt_services::structures::*;
#[cfg(not(target_arch = "wasm32"))]
use zt_strcts::policy_strct::PolicyType;
#[cfg(not(target_arch = "wasm32"))]
use ztlb::policy::PolicyOps;

#[cfg(not(target_arch = "wasm32"))]
#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    init_mtls_identity()?;
    println!("Starting TranscriberService");
    let _transcriber_server = start_transcriber_service().await?;

    println!("TranscriberService started successfully");

    tokio::signal::ctrl_c().await?;
    println!("Shutting down TranscriberService");

    Ok(())
}

/// Starts the transcriber service from the embedded tacvoice policy.
#[cfg(not(target_arch = "wasm32"))]
async fn start_transcriber_service() -> Result<TranscriberServer, Box<dyn std::error::Error>> {
    let policy_xml = get_tacvoice_policy_data()?;
    let policy = PolicyType::load(
        std::str::from_utf8(&policy_xml)
            .map_err(|e| format!("Failed to parse policy XML: {}", e))?,
    );
    let cfg_map = config_map(policy.clone());
    let key_client = init_key_client(
        policy.clone(),
        KEY_CLIENT.to_string(),
        KEY_SERVER.to_string(),
        KEY_SERVICE.to_string(),
        KEY_SERVER.to_string(),
    )
    .await?;
    let client_service = ClientService::new(cfg_map.clone(), key_client.clone()).await;

    let orderwire_client = client_service
        .get_orderwire_client(ORDERWIRE_CLIENT.to_string(), ORDERWIRE_SERVICE.to_string())
        .await
        .map_err(|e| format!("Failed to get orderwire client: {}", e))?;

    let transcriber_service_cfg = cfg_map
        .get(TRANSCRIBER_SERVICE)
        .ok_or("TranscriberService config not found")?;
    let transcriber_service_ip = transcriber_service_cfg
        .ip_address_text
        .as_ref()
        .ok_or("TranscriberService IP not configured")?;
    let transcriber_service_port = transcriber_service_cfg
        .service_port_numeric
        .ok_or("TranscriberService port not configured")?;

    let allowed_addresses = peer_allowlist(&cfg_map, &[TRANSCRIBER_CLIENT, TACVOICE_CLIENT])?;

    let transcriber_interface = MtlsInterface::new(
        TRANSCRIBER_SERVICE.to_string(),
        (transcriber_service_ip.clone(), transcriber_service_port),
        allowed_addresses,
    );

    let mut transcriber_server = TranscriberServer::new(
        TRANSCRIBER_SERVICE.to_string(),
        transcriber_interface,
        orderwire_client,
    );

    transcriber_server.server_interface.start_interface().await?;
    let listener_server = transcriber_server.clone();
    tokio::spawn(async move {
        if let Err(e) = listener_server.listen().await {
            eprintln!("TranscriberService listen error: {}", e);
        }
    });
    println!(
        "TranscriberService started on {}:{}",
        transcriber_service_ip, transcriber_service_port
    );
    println!("Allowed Addresses:");
    for addr in &transcriber_server.server_interface.allowed_addr {
        println!("  {}:{}", addr.0, addr.1);
    }

    Ok(transcriber_server)
}
