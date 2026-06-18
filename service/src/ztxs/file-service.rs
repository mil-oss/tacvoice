use zt_services::client_service::config_map;
use zt_services::structures::*;
use zt_strcts::policy_strct::PolicyType;
use ztlb::policy::PolicyOps;
use std::collections::HashMap;
use tacvoice::config::*;
use tacvoice::policy::peer_allowlist;
use tacvoice::embed::{get_tacvoice_policy_data, init_mtls_identity};  


#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    init_mtls_identity()?;
    println!("Starting FileService");
    let _file_server = start_file_service().await?;

    println!("FileService started successfully");

    tokio::signal::ctrl_c().await?;
    println!("Shutting down FileService");

    Ok(())
}

/// Start the File Service
async fn start_file_service() -> Result<FileServer, Box<dyn std::error::Error>> {
    let policy_xml = get_tacvoice_policy_data()?;
    let policy = PolicyType::load(
        std::str::from_utf8(&policy_xml)
            .map_err(|e| format!("Failed to parse policy XML: {}", e))?,
    );

    let cfg_map = config_map(policy);
    let file_service_cfg = cfg_map
        .get(FILE_SERVICE)
        .ok_or("FileService config not found")?;
    let file_service_ip = file_service_cfg
        .ip_address_text
        .as_ref()
        .ok_or("FileService IP not configured")?;
    let file_service_port = file_service_cfg
        .service_port_numeric
        .ok_or("FileService port not configured")?;

    let allowed_addresses = peer_allowlist(
        &cfg_map,
        &[
            FILE_CLIENT,
            TACVOICE_FILE_CLIENT,
            MESSAGE_REPOSITORY_FILE_CLIENT,
            VOICE_REPOSITORY_FILE_CLIENT,
        ],
    )?;

    let file_interface = MtlsInterface::new(
        FILE_SERVICE.to_string(),
        (file_service_ip.clone(), file_service_port),
        allowed_addresses,
    );

    let mut file_server = FileServer::new(
        FILE_SERVICE.to_string(),
        file_interface,
        HashMap::new(),
    );

    file_server.start_interface().await?;
    println!(
        "FileService started on {}:{}",
        file_service_ip, file_service_port
    );

    Ok(file_server)
}
