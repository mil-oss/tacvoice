mod voicerepo_embed;

use tacvoice::config::*;
use tacvoice::embed::{get_tacvoice_policy_data, init_mtls_identity};
use tacvoice::policy::peer_allowlist;
use voicerepo_embed::{ubm_bin, vosk_model};
use zt_services::client_service::{config_map, init_key_client};
use zt_services::structures::*;
use zt_strcts::policy_strct::PolicyType;
use ztlb::policy::PolicyOps;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    init_mtls_identity()?;
    println!("Starting VoiceRepositoryService");
    let _repository_server = start_voicerepo_service().await?;

    println!("VoiceRepositoryService started successfully");

    tokio::signal::ctrl_c().await?;
    println!("Shutting down VoiceRepositoryService");

    Ok(())
}

/// Starts the voice repository service from embedded tacvoice policy.
async fn start_voicerepo_service() -> Result<RepositoryServer, Box<dyn std::error::Error>> {
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

    let file_client = client_service
        .get_file_client(
            VOICE_REPOSITORY_FILE_CLIENT.to_string(),
            FILE_SERVICE.to_string(),
        )
        .await
        .map_err(|e| format!("Failed to get file client: {}", e))?;

    let orderwire_client = client_service
        .get_orderwire_client(ORDERWIRE_CLIENT.to_string(), ORDERWIRE_SERVICE.to_string())
        .await
        .map_err(|e| format!("Failed to get orderwire client: {}", e))?;

    let voicerepo_service_cfg = cfg_map
        .get(VOICE_REPOSITORY_SERVICE)
        .ok_or("VoiceRepositoryService config not found")?;
    let voicerepo_service_ip = voicerepo_service_cfg
        .ip_address_text
        .as_ref()
        .ok_or("VoiceRepositoryService IP not configured")?;
    let voicerepo_service_port = voicerepo_service_cfg
        .service_port_numeric
        .ok_or("VoiceRepositoryService port not configured")?;

    let allowed_addresses = peer_allowlist(
        &cfg_map,
        &[VOICE_REPOSITORY_CLIENT, TACVOICE_REPOSITORY_CLIENT],
    )?;

    let voicerepo_interface = MtlsInterface::new(
        VOICE_REPOSITORY_SERVICE.to_string(),
        (voicerepo_service_ip.clone(), voicerepo_service_port),
        allowed_addresses,
    );

    let mut voicerepo_server = RepositoryServer::new(
        VOICE_REPOSITORY_SERVICE.to_string(),
        voicerepo_interface,
        file_client,
        orderwire_client,
        vec![VOICE_REPOSITORY_NAME.to_string()],
        VOICE_REPOSITORY_LOCATION.to_string(),
    )
    .await;

    seed_embedded_records(&voicerepo_server).await?;

    voicerepo_server.start_interface().await?;
    println!(
        "VoiceRepositoryService started on {}:{}",
        voicerepo_service_ip, voicerepo_service_port
    );

    Ok(voicerepo_server)
}

/// Loads embedded voice assets directly into the local repository store.
async fn seed_embedded_records(server: &RepositoryServer) -> Result<(), Box<dyn std::error::Error>> {
    let assets: [(&str, Result<Vec<u8>, std::io::Error>); 2] =
        [(VOSK_RESOURCE, vosk_model()), (UBM_RESOURCE, ubm_bin())];
    for (name, data) in assets {
        let bytes = data.map_err(|e| format!("failed to load embedded {}: {}", name, e))?;
        server
            .seed_resource_record(VOICE_REPOSITORY_NAME.to_string(), name.to_string(), bytes)
            .await
            .map_err(|e| format!("failed to seed {}: {}", name, e))?;
        println!("voicerepo: seeded {}", name);
    }
    Ok(())
}
