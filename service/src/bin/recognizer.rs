//! Recognizer binary: standalone tarpc service that publishes recognition results
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
use tacvoice::server::structures::RecognizerServer;
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
    println!("Starting RecognizerService");
    let _recognizer_server = start_recognizer_service().await?;

    println!("RecognizerService started successfully");

    tokio::signal::ctrl_c().await?;
    println!("Shutting down RecognizerService");

    Ok(())
}

/// Starts the recognizer service from the embedded tacvoice policy.
#[cfg(not(target_arch = "wasm32"))]
async fn start_recognizer_service() -> Result<RecognizerServer, Box<dyn std::error::Error>> {
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

    let recognizer_service_cfg = cfg_map
        .get(RECOGNIZER_SERVICE)
        .ok_or("RecognizerService config not found")?;
    let recognizer_service_ip = recognizer_service_cfg
        .ip_address_text
        .as_ref()
        .ok_or("RecognizerService IP not configured")?;
    let recognizer_service_port = recognizer_service_cfg
        .service_port_numeric
        .ok_or("RecognizerService port not configured")?;

    let allowed_addresses = peer_allowlist(&cfg_map, &[RECOGNIZER_CLIENT, TACVOICE_CLIENT])?;

    let recognizer_interface = MtlsInterface::new(
        RECOGNIZER_SERVICE.to_string(),
        (recognizer_service_ip.clone(), recognizer_service_port),
        allowed_addresses,
    );

    let mut recognizer_server = RecognizerServer::new(
        RECOGNIZER_SERVICE.to_string(),
        recognizer_interface,
        orderwire_client,
    );

    recognizer_server.server_interface.start_interface().await?;
    let listener_server = recognizer_server.clone();
    tokio::spawn(async move {
        if let Err(e) = listener_server.listen().await {
            eprintln!("RecognizerService listen error: {}", e);
        }
    });
    println!(
        "RecognizerService started on {}:{}",
        recognizer_service_ip, recognizer_service_port
    );

    Ok(recognizer_server)
}
