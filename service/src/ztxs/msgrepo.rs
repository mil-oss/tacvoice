mod msgrepo_embed;

use msgrepo_embed::messages_xml;
use tacvoice::config::*;
use tacvoice::embed::{get_tacvoice_policy_data, init_mtls_identity};
use tacvoice::policy::peer_allowlist;
use zt_services::client_service::{config_map, init_key_client};
use zt_services::structures::*;
use zt_strcts::policy_strct::PolicyType;
use ztlb::policy::PolicyOps;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    init_mtls_identity()?;
    println!("Starting MessageRepositoryService");
    let _repository_server = start_msgrepo_service().await?;

    println!("MessageRepositoryService started successfully");

    tokio::signal::ctrl_c().await?;
    println!("Shutting down MessageRepositoryService");

    Ok(())
}

/// Starts the message repository service from embedded tacvoice policy.
async fn start_msgrepo_service() -> Result<RepositoryServer, Box<dyn std::error::Error>> {
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
            MESSAGE_REPOSITORY_FILE_CLIENT.to_string(),
            FILE_SERVICE.to_string(),
        )
        .await
        .map_err(|e| format!("Failed to get file client: {}", e))?;

    let orderwire_client = client_service
        .get_orderwire_client(ORDERWIRE_CLIENT.to_string(), ORDERWIRE_SERVICE.to_string())
        .await
        .map_err(|e| format!("Failed to get orderwire client: {}", e))?;

    let msgrepo_service_cfg = cfg_map
        .get(MESSAGE_REPOSITORY_SERVICE)
        .ok_or("MessageRepositoryService config not found")?;
    let msgrepo_service_ip = msgrepo_service_cfg
        .ip_address_text
        .as_ref()
        .ok_or("MessageRepositoryService IP not configured")?;
    let msgrepo_service_port = msgrepo_service_cfg
        .service_port_numeric
        .ok_or("MessageRepositoryService port not configured")?;

    let allowed_addresses = peer_allowlist(
        &cfg_map,
        &[MESSAGE_REPOSITORY_CLIENT, TACVOICE_REPOSITORY_CLIENT],
    )?;

    let msgrepo_interface = MtlsInterface::new(
        MESSAGE_REPOSITORY_SERVICE.to_string(),
        (msgrepo_service_ip.clone(), msgrepo_service_port),
        allowed_addresses,
    );

    let mut msgrepo_server = RepositoryServer::new(
        MESSAGE_REPOSITORY_SERVICE.to_string(),
        msgrepo_interface,
        file_client,
        orderwire_client,
        vec![MESSAGE_REPOSITORY_NAME.to_string()],
        MESSAGE_REPOSITORY_LOCATION.to_string(),
    )
    .await;

    seed_embedded_records(&msgrepo_server).await?;

    msgrepo_server.start_interface().await?;
    println!(
        "MessageRepositoryService started on {}:{}",
        msgrepo_service_ip, msgrepo_service_port
    );

    Ok(msgrepo_server)
}

/// Loads embedded messages.xml directly into the local repository store.
async fn seed_embedded_records(server: &RepositoryServer) -> Result<(), Box<dyn std::error::Error>> {
    let xml = messages_xml().map_err(|e| format!("failed to load embedded messages.xml: {}", e))?;
    server
        .seed_resource_record(
            MESSAGE_REPOSITORY_NAME.to_string(),
            MESSAGES_RESOURCE.to_string(),
            xml,
        )
        .await
        .map_err(|e| format!("failed to seed {}: {}", MESSAGES_RESOURCE, e))?;
    println!("msgrepo: seeded {}", MESSAGES_RESOURCE);
    Ok(())
}
