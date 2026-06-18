//! TacVoice Zero Trust Server
//! //! HTTP server that stages server assets to FileService for ZT consumers and serves the UI from embedded assets.
//! Static HTTP responses use RustEmbed only; they do not call FileService retrieve.

// This binary only compiles for native (non-WASM) targets

#[cfg(target_arch = "wasm32")]
fn main() {}

#[cfg(not(target_arch = "wasm32"))]
mod native {
    use axum::body::Body;
    use axum::extract::Extension;
    use axum::http::{header, StatusCode};
    use axum::response::IntoResponse;
    use axum::Router;
    use hyper::Request;
    use zt_services::client_service::{mtls_client_interface, mtls_client_interface_ex};
    use zt_services::structures::{ClientService, FileClient, KeyClient, ServiceCfgType};
    use std::collections::HashMap;
    use std::error::Error;
    use std::sync::Arc;
    use tokio::signal;
    use tokio::spawn;
    use tokio_native_tls::native_tls::Identity;
    use tacvoice::config::*;
    use tacvoice::server::embed::{
        get_asset, get_web_asset, init_mtls_identity,ServerAssets,
    };
    use tacvoice::server::gateway_client::{
        RecognizerGatewayClient, TacVoiceGatewayClient, TranscriberGatewayClient,
    };
    use tacvoice::server::auth::{entity_names, OidcVerifier};
    use tacvoice::server::auth_claims::AuthContext;
    use tacvoice::server::messages;
    use tacvoice::server::structures::{
        RecognizerClient, TacVoiceClient, TacVoiceServer, TranscriberClient,
    };
    use tacvoice_client::messages::{LineKind, Message, MessageGroup};
    use zt_gateway::build_tacvoice_grpc_router;
    use zt_strcts::policy_strct::{DeviceType, PolicyType};
    use ztlb::policy::PolicyOps;
    use zt_services::network_service;

    /// Debug flag for conditional printing.
    const DBG: bool = true;

    /// Prints a debug message if the `DBG` constant is true.
    fn dbg_println(msg: &str) {
        if DBG {
            println!("[tacvoice-service]{}", msg);
        }
    }

    pub async fn main_inner() -> Result<(), Box<dyn Error>> {
        dbg_println("TacVoice Server");
        init_mtls_identity()?;
        // Load Init Policy to get Published TacVoice Policy
        let init_policy_xml =
            ServerAssets::get(POLICY_FILE).ok_or_else(|| "Embedded policy file not found")?;
        let init_policy_content = String::from_utf8(init_policy_xml.data.to_vec())
            .map_err(|e| format!("Invalid UTF-8 in policy file: {}", e))?;
        // Parse policy XML into PolicyType structure
        let init_policy = PolicyType::load(&init_policy_content);
        // Initialize the complete ZT services ecosystem
        let (tacvoice_policy, tacvoice_client_service, tacvoice_client) =
            initialize_zt_clients(init_policy.clone())
                .await
                .map_err(|e| {
                    println!("Failed to initialize ZT services: {}", e);
                    e // Return the actual error
                })?;

        let tacvoice_cfg_map = config_map(tacvoice_policy.clone())?;
        load_catalog_from_repo(&tacvoice_client_service, &tacvoice_cfg_map).await?;

        // HTTPS edge binds before TacVoiceServer and background repo warm-up.
        let tacvoice_web_service_cfg = tacvoice_cfg_map
            .get(&TACVOICE_WEB_SERVICE.to_string())
            .ok_or_else(|| {
            Box::<dyn Error>::from(format!(
                "TacVoiceWebService configuration not found in policy. Available services: {:?}",
                tacvoice_cfg_map.keys().collect::<Vec<_>>()
            ))
        })?;
        let host = tacvoice_web_service_cfg
            .ip_address_text
            .clone()
            .unwrap_or_else(|| "FAIL".to_string());
        let port = tacvoice_web_service_cfg.service_port_numeric.unwrap_or(0);
        let edge_plaintext = std::env::var(EDGE_PLAINTEXT_ENV)
            .map(|v| v == "1" || v.eq_ignore_ascii_case("true"))
            .unwrap_or(false);
        let identity = if edge_plaintext {
            dbg_println("Edge plaintext mode: serving HTTP, TLS handled by Istio gateway");
            None
        } else {
            let cert_bytes = ServerAssets::get("keys/public-chain.crt")
                .ok_or_else(|| Box::<dyn Error>::from("Certificate not found in embedded assets"))?
                .data
                .to_vec();
            let key_bytes = ServerAssets::get("keys/private.key")
                .ok_or_else(|| Box::<dyn Error>::from("Private key not found in embedded assets"))?
                .data
                .to_vec();
            Some(
                Identity::from_pkcs8(&cert_bytes, &key_bytes).map_err(|e| {
                    Box::<dyn Error>::from(format!("Failed to create TLS identity: {}", e))
                })?,
            )
        };

        let gateway_client = Box::new(TacVoiceGatewayClient::new(tacvoice_client.clone()))
            as Box<dyn zt_gateway::TacVoiceClientOps>;
        let transcriber_client = build_service_client::<TranscriberClient>(
            &tacvoice_cfg_map,
            TRANSCRIBER_CLIENT,
            TRANSCRIBER_SERVICE,
            TranscriberClient::new,
        )?;
        let recognizer_client = build_service_client::<RecognizerClient>(
            &tacvoice_cfg_map,
            RECOGNIZER_CLIENT,
            RECOGNIZER_SERVICE,
            RecognizerClient::new,
        )?;
        let transcriber_gateway_client = Box::new(TranscriberGatewayClient::new(transcriber_client))
            as Box<dyn zt_gateway::TranscriberClientOps>;
        let recognizer_gateway_client = Box::new(RecognizerGatewayClient::new(recognizer_client))
            as Box<dyn zt_gateway::RecognizerClientOps>;
        let oidc_verifier = OidcVerifier::from_env(entity_names(&tacvoice_policy)).map(Arc::new);
        let tls_server_host = host.clone();
        spawn(async move {
            dbg_println(&format!(
                "Starting TacVoice UI Server on {}:{}",
                tls_server_host, port
            ));
            if let Err(e) = run_tacvoice_https_server(
                tls_server_host,
                port,
                identity,
                oidc_verifier,
                gateway_client,
                transcriber_gateway_client,
                recognizer_gateway_client,
                HashMap::new(),
            )
            .await
            {
                dbg_println(&format!("TacVoice UI Server error: {}", e));
            }
        });

        // Create tacvoice instance
        let server = TacVoiceServer::new(APP.to_string(), tacvoice_policy.clone())
            .await
            .map_err(|e| {
                Box::<dyn Error>::from(format!("{}: {}", "Failed to create TacVoice server", e))
            })?;

        // Initialize stats from ledger entries in background so UI starts immediately
        let server_clone = server.clone();
        tokio::spawn(async move {
            dbg_println("Initializing stats from ledger...");
            if let Err(e) = server_clone.initialize_stats_from_ledger().await {
                eprintln!("Warning: Failed to initialize stats from ledger: {}", e);
            }
        });

        // Start the tacvoice server in a separate task and return immediately
        let mut server_clone = server.clone();
        tokio::spawn(async move {
            dbg_println("Starting TacVoiceServer interface...");
            if let Err(e) = server_clone.start_interface().await {
                eprintln!("Server error: {}", e);
            }
        });
        // Give the server a moment to start listening before continuing
        dbg_println(
            "TacVoiceServer started in background task, waiting for interface to initialize...",
        );
        tokio::time::sleep(tokio::time::Duration::from_millis(500)).await;
        dbg_println("TacVoiceServer should now be ready to accept connections");

        let system_ledger = server.system_ledger.clone();
        let startmsg = format!("server {} started", server.server_id.clone());
        spawn(async move {
            if let Err(e) = system_ledger
                .log_activity("sysop", startmsg.into_bytes().to_vec())
                .await
            {
                println!("Warning: Failed to log server startup: {}", e);
            } else {
                println!("Server startup logged to ledger");
            }
        });

        // FileService preload runs in the background (vosk model pulled from voicerepo).
        let upload_client_service = tacvoice_client_service.clone();
        let upload_cfg_map = tacvoice_cfg_map.clone();
        spawn(async move {
            match upload_assets(upload_client_service, upload_cfg_map).await {
                Ok(_) => dbg_println("Asset preload complete"),
                Err(e) => {
                    eprintln!("[tacvoice-service] background upload_assets failed: {}", e);
                }
            }
        });
        // Create a shutdown flag to coordinate between signal handler and main thread
        let shutdown_flag = std::sync::Arc::new(std::sync::atomic::AtomicBool::new(false));

        // Spawn signal handler task; flips the flag so the wait loop exits.
        let signal_flag = shutdown_flag.clone();
        let signal_handle = tokio::spawn(async move {
            match signal::ctrl_c().await {
                Ok(()) => {
                    println!("\n========================================");
                    println!("SHUTDOWN SIGNAL RECEIVED");
                    println!("========================================");
                }
                Err(err) => {
                    eprintln!("Error waiting for shutdown signal: {}", err);
                }
            }
            signal_flag.store(true, std::sync::atomic::Ordering::Relaxed);
        });
        while !shutdown_flag.load(std::sync::atomic::Ordering::Relaxed) {
            tokio::time::sleep(tokio::time::Duration::from_millis(100)).await;
        }
        let _ = signal_handle.await;

        // Record the shutdown in the ledger before returning.
        match server.system_ledger.log_shutdown().await {
            Ok(()) => println!("Server shutdown logged to ledger"),
            Err(e) => eprintln!("Warning: Failed to log server shutdown: {}", e),
        }
        println!("Shutdown logged. Background services still running.");
        println!("Use 'kill <pid>' or 'pkill tacvoice-server' to terminate.");
        Ok(())
    }

    /// Extracts gateway URL from policy configuration
    fn extract_gateway_url(
        cfg_map: &HashMap<String, ServiceCfgType>,
    ) -> Result<String, Box<dyn Error>> {
        let gateway_cfg = cfg_map
            .get(&GATEWAY_SERVICE.to_string())
            .ok_or_else(|| format!("Gateway service configuration not found in policy. Looking for: {}. Available services: {:?}", GATEWAY_SERVICE, cfg_map.keys().collect::<Vec<_>>()))?;
        let gateway_ip = gateway_cfg
            .ip_address_text
            .clone()
            .ok_or_else(|| "Gateway IP not configured".to_string())?;
        let gateway_port = gateway_cfg
            .service_port_numeric
            .ok_or_else(|| "Gateway port not configured".to_string())?;
        // Co-located with ZTXS: policy bind is 0.0.0.0 but the HTTPS proxy must dial loopback.
        let connect_ip = if gateway_ip == "0.0.0.0" {
            "127.0.0.1".to_string()
        } else {
            gateway_ip
        };
        Ok(format!("http://{}:{}", connect_ip, gateway_port))
    }

    /// Builds a FileClient that binds the client's own policy port (not TacVoiceClientService).
    fn bound_file_client(
        cfg_map: &HashMap<String, ServiceCfgType>,
        client_name: &str,
    ) -> Result<FileClient, Box<dyn Error>> {
        let client_cfg = cfg_map
            .get(client_name)
            .ok_or_else(|| format!("{} configuration not found", client_name))?;
        let server_cfg = cfg_map
            .get(FILE_SERVICE)
            .ok_or_else(|| format!("{} configuration not found", FILE_SERVICE))?;
        let iface = mtls_client_interface_ex(client_cfg, server_cfg, Some(client_cfg)).map_err(
            |e| format!("Failed to build {} file interface: {}", client_name, e),
        )?;
        let name = client_cfg
            .service_name_text
            .clone()
            .unwrap_or_else(|| client_name.to_string());
        Ok(FileClient::new(name, iface))
    }

    // Preload embedded web assets into FileServer
    pub async fn upload_assets(
        client_service: ClientService,
        cfg_map: HashMap<String, ServiceCfgType>,
    ) -> Result<FileClient, Box<dyn std::error::Error>> {
        dbg_println("Preloading embedded TacVoice assets into FileServer");
        let file_client = bound_file_client(&cfg_map, FILE_CLIENT).map_err(|e| {
            Box::<dyn Error>::from(format!("Failed to init FileService client: {}", e))
        })?;

        // Gateway URL from policy (HTTPS server proxies gRPC-Web to this address)
        let gateway_url = extract_gateway_url(&cfg_map)?;
        dbg_println(&format!("Gateway URL from policy: {}", gateway_url));
        for path in ServerAssets::iter() {
            let p = path.as_ref();
            if let Some(rest) = p.strip_prefix("www/") {
                if rest == VOSK_WEB_PATH {
                    continue;
                }
                if let Some(file) = ServerAssets::get(p) {
                    let bytes = file.data.to_vec();
                    let bytes_len = bytes.len();
                    if let Err(e) = file_client.retain(rest.to_string(), bytes).await {
                        dbg_println(&format!("Failed to retain {}: {}", rest, e));
                    } else {
                        dbg_println(&format!("Uploaded: {} ({} bytes)", rest, bytes_len));
                    }
                }
            }
        }
        let vosk_bytes = pull_repo_resource(
            &client_service,
            &cfg_map,
            VOICE_REPOSITORY_CLIENT,
            VOICE_REPOSITORY_SERVICE,
            VOICE_REPOSITORY_NAME,
            VOSK_RESOURCE,
        )
        .await
        .map_err(|e| format!("failed to pull {} from voicerepo: {}", VOSK_RESOURCE, e))?;
        file_client
            .retain(VOSK_WEB_PATH.to_string(), vosk_bytes.clone())
            .await
            .map_err(|e| format!("failed to retain {} in FileService: {}", VOSK_WEB_PATH, e))?;
        dbg_println(&format!(
            "Uploaded: {} ({} bytes) from voicerepo",
            VOSK_WEB_PATH,
            vosk_bytes.len()
        ));
        Ok(file_client)
    }

    /// Builds a policy-bound tarpc client of type `T` from client and server cfg entries.
    /// Returns an error if either policy entry is missing or the interface cannot be built.
    fn build_service_client<T>(
        cfg_map: &HashMap<String, ServiceCfgType>,
        client_name: &str,
        service_name: &str,
        ctor: fn(String, zt_services::structures::MtlsInterface) -> T,
    ) -> Result<T, Box<dyn Error>> {
        let client_cfg = cfg_map
            .get(client_name)
            .ok_or_else(|| format!("{} configuration not found", client_name))?;
        let server_cfg = cfg_map
            .get(service_name)
            .ok_or_else(|| format!("{} configuration not found", service_name))?;
        let iface = mtls_client_interface(client_cfg, server_cfg)
            .map_err(|e| format!("Failed to build {} interface: {}", client_name, e))?;
        let name = client_cfg
            .service_name_text
            .clone()
            .unwrap_or_else(|| client_name.to_string());
        Ok(ctor(name, iface))
    }

    /// Maps a repository RPC client to the File Client that stages its resources.
    fn repo_file_client(repo_client: &str) -> Result<&'static str, String> {
        match repo_client {
            MESSAGE_REPOSITORY_CLIENT => Ok(MESSAGE_REPOSITORY_FILE_CLIENT),
            VOICE_REPOSITORY_CLIENT => Ok(VOICE_REPOSITORY_FILE_CLIENT),
            _ => Err(format!("no file client for repository client {}", repo_client)),
        }
    }

    /// Builds a FileClient for repo staging retrieval.
    /// Uses TacVoiceClientService bind (30630) so we do not collide with co-located
    /// msgrepo/voicerepo on :33100/:33110, and shares one TCP/mTLS session to FileService.
    fn repo_retrieve_file_client(
        cfg_map: &HashMap<String, ServiceCfgType>,
        repo_file_client_name: &str,
    ) -> Result<FileClient, String> {
        let bind_cfg = cfg_map
            .get(TACVOICE_CLIENT)
            .ok_or_else(|| format!("{} configuration not found", TACVOICE_CLIENT))?;
        let server_cfg = cfg_map
            .get(FILE_SERVICE)
            .ok_or_else(|| format!("{} configuration not found", FILE_SERVICE))?;
        let iface = mtls_client_interface_ex(bind_cfg, server_cfg, Some(bind_cfg))?;
        let repo_cfg = cfg_map
            .get(repo_file_client_name)
            .ok_or_else(|| format!("{} configuration not found", repo_file_client_name))?;
        let id = repo_cfg
            .service_name_text
            .clone()
            .unwrap_or_else(|| repo_file_client_name.to_string());
        Ok(FileClient::new(id, iface))
    }

    /// Pulls a static resource from a ZT repository via File Service staging.
    async fn pull_repo_resource(
        client_service: &ClientService,
        cfg_map: &HashMap<String, ServiceCfgType>,
        repo_client: &str,
        repo_service: &str,
        repo_name: &str,
        resource: &str,
    ) -> Result<Vec<u8>, String> {
        let repository = client_service
            .get_repository_client(repo_client.to_string(), repo_service.to_string())
            .await?;
        let file_client_name = repo_file_client(repo_client)?;
        let file_client = repo_retrieve_file_client(cfg_map, file_client_name)?;
        let mut last_err = "resource not found".to_string();
        for attempt in 0..20 {
            dbg_println(&format!(
                "pull {}:{} attempt {}",
                repo_name, resource, attempt + 1
            ));
            println!("[tacvoice-service] pull {}:{} attempt {}", repo_name, resource, attempt + 1);
            match tokio::time::timeout(
                tokio::time::Duration::from_secs(15),
                repository.get_resource_record(repo_name.to_string(), resource.to_string()),
            )
            .await
            {
                Ok(Ok(path)) => {
                    let delivery_timeout = if resource == VOSK_RESOURCE {
                        tokio::time::Duration::from_secs(120)
                    } else {
                        tokio::time::Duration::from_secs(30)
                    };
                    dbg_println(&format!(
                        "{} staged {}; retrieving from FileService",
                        repo_name, path
                    ));
                    let deadline =
                        tokio::time::Instant::now() + delivery_timeout;
                    let mut retrieve_err;
                    loop {
                        retrieve_err = match file_client.retrieve(path.clone()).await {
                            Ok(bytes) if !bytes.is_empty() => {
                                dbg_println(&format!(
                                    "FileService delivered {} ({} bytes)",
                                    path,
                                    bytes.len()
                                ));
                                return Ok(bytes);
                            }
                            Ok(_) => {
                                format!("FileService returned empty data for {}", path)
                            }
                            Err(e) => e,
                        };
                        if tokio::time::Instant::now() >= deadline {
                            last_err = format!(
                                "FileService did not deliver {} within {:?} (last: {})",
                                path, delivery_timeout, retrieve_err
                            );
                            eprintln!("[tacvoice-service] {}", last_err);
                            break;
                        }
                        tokio::time::sleep(tokio::time::Duration::from_millis(250)).await;
                    }
                }
                Ok(Err(e)) => {
                    last_err = e;
                    tokio::time::sleep(tokio::time::Duration::from_millis(500)).await;
                }
                Err(_) => {
                    last_err = format!(
                        "get_resource_record timed out for {}/{}",
                        repo_name, resource
                    );
                    tokio::time::sleep(tokio::time::Duration::from_millis(500)).await;
                }
            }
        }
        Err(last_err)
    }

    /// Loads the tactical message catalog from msgrepo; startup fails if unavailable.
    async fn load_catalog_from_repo(
        client_service: &ClientService,
        cfg_map: &HashMap<String, ServiceCfgType>,
    ) -> Result<(), Box<dyn Error>> {
        let bytes = pull_repo_resource(
            client_service,
            cfg_map,
            MESSAGE_REPOSITORY_CLIENT,
            MESSAGE_REPOSITORY_SERVICE,
            MESSAGE_REPOSITORY_NAME,
            MESSAGES_RESOURCE,
        )
        .await
        .map_err(|e| format!("failed to pull messages.xml from msgrepo: {}", e))?;
        let xml = std::str::from_utf8(&bytes)
            .map_err(|e| format!("messages.xml is not valid UTF-8: {}", e))?;
        if !messages::init_catalog_from_bytes(xml) {
            return Err("messages.xml from msgrepo parsed to an empty catalog".into());
        }
        dbg_println("Message catalog loaded from msgrepo");
        Ok(())
    }

    /// Extracts service configuration map from policy, merging device and service data.
    fn config_map(
        policy: PolicyType,
    ) -> std::result::Result<HashMap<String, ServiceCfgType>, Box<dyn std::error::Error>> {
        let mut device_map = HashMap::<String, DeviceType>::new();
        let devices = policy
            .devices
            .clone()
            .ok_or_else(|| "Policy devices not configured")?
            .device
            .clone();
        for device in devices {
            if let Some(name) = &device.name_text {
                device_map.insert(name.clone(), device.clone());
            }
        }
        let mut service_map = HashMap::<String, ServiceCfgType>::new();
        let services = policy
            .services
            .clone()
            .ok_or_else(|| "Policy services not configured")?
            .service
            .clone();
        for service in services {
            if let Some(device_name_text) = &service.device_name_text {
                if let Some(device) = device_map.get(device_name_text) {
                    let service_cfg = ServiceCfgType {
                        index_numeric: service
                            .index_numeric
                            .and_then(|idx| idx.parse::<u16>().ok()),
                        id_text: service.name_text.clone(),
                        service_name_text: service.name_text.clone(),
                        interface_text: service.interface_text.clone(),
                        device_name_text: device.clone().name_text,
                        ip_address_text: device.clone().ip_address_text,
                        service_port_numeric: service
                            .service_port_numeric
                            .and_then(|port| port.parse::<u16>().ok()),
                        description_text: service.description_text.clone(),
                        label_text: device.clone().label_text,
                        policy_id_text: service.policy_id_text.clone(),
                        key_name_text: service.key_name_text.clone(),
                    };
                    if let Some(service_name) = &service.name_text {
                        service_map.insert(service_name.clone(), service_cfg);
                    }
                } else {
                    println!("Device not found: {}", device_name_text);
                }
            }
        }
        Ok(service_map)
    }

    /// Copies routable device IPs from the embedded init policy into a retrieved policy.
    fn overlay_device_ips(target: &mut PolicyType, source: &PolicyType) {
        let Some(source_devices) = source.devices.as_ref().map(|d| &d.device) else {
            return;
        };
        let Some(target_devices) = target.devices.as_mut().map(|d| &mut d.device) else {
            return;
        };
        for target_dev in target_devices.iter_mut() {
            let Some(target_ip) = target_dev.ip_address_text.as_deref() else {
                continue;
            };
            if target_ip != "0.0.0.0" && target_ip != "127.0.0.1" {
                continue;
            }
            let target_name = target_dev.name_text.as_deref();
            let Some(source_dev) = source_devices
                .iter()
                .find(|d| d.name_text.as_deref() == target_name)
            else {
                continue;
            };
            let Some(source_ip) = source_dev.ip_address_text.as_deref() else {
                continue;
            };
            if source_ip != "0.0.0.0" && source_ip != "127.0.0.1" {
                target_dev.ip_address_text = Some(source_ip.to_string());
            }
        }
    }

    /// Initialize and start all ZT services from embedded policy
    async fn initialize_zt_clients(
        init_policy: PolicyType,
    ) -> Result<(PolicyType, ClientService, TacVoiceClient), Box<dyn std::error::Error>> {
        println!("Initializing Zero Trust Infrastructure Services...");
        // Create service configuration map from policy
        let init_cfg_map = config_map(init_policy.clone())?;
        // Init the key service first (required for all other services)
        let key_client_cfg = init_cfg_map
            .get(&KEY_CLIENT.to_string())
            .ok_or_else(|| "Key client configuration not found")?;
        let host_bind_cfg = init_cfg_map
            .get(&TACVOICE_CLIENT.to_string())
            .ok_or_else(|| "TacVoice client bind configuration not found")?;
        let key_service_cfg = init_cfg_map
            .get(&KEY_SERVICE.to_string())
            .ok_or_else(|| "Key client configuration not found")?;
        // Generate client keys
        let key_service_machine_ip = key_service_cfg
            .ip_address_text
            .clone()
            .expect("Key server IP address not configured");
        let key_service_port = key_service_cfg
            .service_port_numeric
            .expect("Key server service port not configured");

        dbg_println(&format!(
            "Key service machine IP: {}, mTLS port: {}",
            key_service_machine_ip, key_service_port
        ));

        let key_client_interface =
            mtls_client_interface_ex(key_client_cfg, key_service_cfg, Some(host_bind_cfg)).map_err(
                |e| format!("Failed to build key client interface: {}", e),
            )?;
        let key_client = KeyClient::new(
            key_client_cfg
                .service_name_text
                .clone()
                .expect("Key client service name not configured"),
            key_client_interface,
        );
        dbg_println(&format!(
            "KeyClient created: name={}, interface={}, address={}:{}, server={}:{}",
            key_client.name,
            key_client.client_interface.name,
            key_client.client_interface.address.0,
            key_client.client_interface.address.1,
            key_client.client_interface.allowed_addr[0].0,
            key_client.client_interface.allowed_addr[0].1
        ));

        // Test KeyService connectivity with ping before proceeding
        dbg_println(&format!(
            "Testing KeyService connectivity to {}:{}...",
            key_service_machine_ip, key_service_port
        ));
        let ping_result =
            tokio::time::timeout(tokio::time::Duration::from_secs(5), key_client.ping()).await;

        match ping_result {
            Ok(Ok(response)) => {
                dbg_println(&format!("KeyService ping successful: {}", response));
            }
            Ok(Err(e)) => {
                eprintln!("ERROR: KeyService ping failed: {}", e);
                return Err(Box::<dyn Error>::from(format!(
                    "KeyService ping failed: {}",
                    e
                )));
            }
            Err(_) => {
                eprintln!(
                    "ERROR: KeyService ping timed out after 5 seconds. Cannot connect to {}:{}",
                    key_service_machine_ip, key_service_port
                );
                return Err(Box::<dyn Error>::from(format!(
                    "KeyService ping timed out - cannot connect to {}:{}",
                    key_service_machine_ip, key_service_port
                )));
            }
        }

        // Create ClientService with policy configs and key client
        dbg_println("Creating ClientService with key client...");
        let init_client_service = ClientService::new(init_cfg_map.clone(), key_client.clone())
            .await
            .with_remote_bind(TACVOICE_CLIENT.to_string());
        dbg_println("ClientService created successfully");
        dbg_println(&format!(
            "Attempting to get policy client: client={}, server={}",
            POLICY_CLIENT, POLICY_SERVICE
        ));

        // Add detailed logging with timeout to see where it hangs
        let policy_client_result = tokio::time::timeout(
            tokio::time::Duration::from_secs(15),
            init_client_service
                .get_policy_client(POLICY_CLIENT.to_string(), POLICY_SERVICE.to_string()),
        )
        .await;

        let policy_client = match policy_client_result {
            Ok(Ok(client)) => {
                dbg_println("Policy client retrieved successfully");
                client
            }
            Ok(Err(e)) => {
                dbg_println(&format!("ERROR: Failed to get policy client: {}", e));
                return Err(Box::<dyn Error>::from(format!(
                    "Failed to get policy client: {}",
                    e
                )));
            }
            Err(_) => {
                eprintln!("ERROR: get_policy_client timed out after 15 seconds.");
                return Err(Box::<dyn Error>::from(
                    "get_policy_client timed out",
                ));
            }
        };
        // Retrieve Published TacVoice Policy
        let mut server_policy = policy_client
            .retrieve_policy(TACVOICE_POLICY_ID.to_string())
            .await
            .map_err(|e| {
                dbg_println(&format!("Policy retrieval error: {}", e));
                Box::<dyn Error>::from(format!(
                    "Failed to retrieve policy '{}': {}",
                    TACVOICE_POLICY_ID, e
                ))
            })?;
        overlay_device_ips(&mut server_policy, &init_policy);
        // Create service configuration map from policy
        let server_cfg_map = config_map(server_policy.clone())?;
        // Create ClientService with policy configs and key client
        let server_client_service = ClientService::new(server_cfg_map.clone(), key_client.clone())
            .await
            .with_remote_bind(TACVOICE_CLIENT.to_string());

        // Create TacVoiceClient for gateway to forward browser requests to TacVoiceServer.
        // Same pattern as ClientService::get_file_client: key from key service by client name.
        let tacvoice_client_cfg = server_cfg_map
            .get(&TACVOICE_CLIENT.to_string())
            .ok_or_else(|| "TacVoice client configuration not found")?
            .clone();
        let tacvoice_server_cfg = server_cfg_map
            .get(&TACVOICE_SERVICE.to_string())
            .ok_or_else(|| "TacVoice server configuration not found")?
            .clone();
        let tacvoice_client_interface =
            mtls_client_interface(&tacvoice_client_cfg, &tacvoice_server_cfg).map_err(|e| {
                format!("Failed to build TacVoice client interface: {}", e)
            })?;
        let tacvoice_client = TacVoiceClient::new(
            tacvoice_client_cfg
                .service_name_text
                .unwrap_or_else(|| TACVOICE_CLIENT.to_string()),
            tacvoice_client_interface,
        );

        println!("All ZTXS clients initialized successfully");
        Ok((server_policy, server_client_service, tacvoice_client))
    }

    /// Shared state for the unified HTTPS server
    struct TacVoiceServerState {
        /// In-memory cache: path key (same as `www/` relative path) -> body.
        static_cache: Arc<tokio::sync::RwLock<HashMap<String, Vec<u8>>>>,
        /// OIDC verifier; None when OIDC is unconfigured (legacy K3s path).
        verifier: Option<Arc<OidcVerifier>>,
    }

    /// Serves one accepted connection (TLS or plaintext) through the axum router.
    /// Generic over the stream type so the same path handles both edge modes.
    async fn serve_edge_connection<S>(io_stream: S, app: Router, peer_addr: std::net::SocketAddr)
    where
        S: tokio::io::AsyncRead + tokio::io::AsyncWrite + Unpin + Send + 'static,
    {
        let io = hyper_util::rt::TokioIo::new(io_stream);
        let hyper_service =
            hyper::service::service_fn(move |req: Request<hyper::body::Incoming>| {
                let mut app = app.clone();
                async move {
                    use tower::Service;
                    app.call(req).await
                }
            });
        if hyper::server::conn::http1::Builder::new()
            .serve_connection(io, hyper_service)
            .with_upgrades()
            .await
            .is_err()
        {
            eprintln!("Invalid request from {}", peer_addr);
        }
    }

    /// Unified edge server: embedded gRPC-Web gateway and static file serving.
    /// When `identity` is None the edge serves plain HTTP (Istio terminates TLS).
    async fn run_tacvoice_https_server(
        address: String,
        port: u16,
        identity: Option<Identity>,
        verifier: Option<Arc<OidcVerifier>>,
        gateway_client: Box<dyn zt_gateway::TacVoiceClientOps>,
        transcriber_client: Box<dyn zt_gateway::TranscriberClientOps>,
        recognizer_client: Box<dyn zt_gateway::RecognizerClientOps>,
        initial_cache: HashMap<String, Vec<u8>>,
    ) -> Result<(), Box<dyn Error + Send + Sync>> {
        let grpc_router =
            build_tacvoice_grpc_router(gateway_client, transcriber_client, recognizer_client);
        let state = Arc::new(TacVoiceServerState {
            static_cache: Arc::new(tokio::sync::RwLock::new(initial_cache)),
            verifier,
        });

        // axum defaults to a 2MB body cap; lift it so linked-blob uploads (up to the
        // gateway's PUBLIC_LINKED_MAX_BYTES, ~10MB) are not rejected at the edge.
        let app = Router::new()
            .merge(grpc_router)
            .fallback(handle_request)
            .layer(Extension(state))
            .layer(axum::extract::DefaultBodyLimit::disable());

        let tls_acceptor = match identity {
            Some(id) => {
                let native_acceptor =
                    tokio_native_tls::native_tls::TlsAcceptor::builder(id).build()?;
                Some(tokio_native_tls::TlsAcceptor::from(native_acceptor))
            }
            None => None,
        };

        let addr = if address == "0.0.0.0" {
            std::net::SocketAddr::from(([0, 0, 0, 0], port))
        } else {
            network_service::resolve_domain_to_ip(address, port).await?
        };
        let listener = tokio::net::TcpListener::bind(addr).await?;
        dbg_println(&format!(
            "TacVoice edge server listening on {} ({})",
            addr,
            if tls_acceptor.is_some() { "https" } else { "http" }
        ));

        loop {
            let (tcp_stream, peer_addr) = listener.accept().await?;
            let app = app.clone();

            match &tls_acceptor {
                Some(acceptor) => {
                    let acceptor = acceptor.clone();
                    spawn(async move {
                        match acceptor.accept(tcp_stream).await {
                            Ok(tls_stream) => {
                                serve_edge_connection(tls_stream, app, peer_addr).await
                            }
                            Err(_) => eprintln!("TLS handshake failed from {}", peer_addr),
                        }
                    });
                }
                None => {
                    spawn(serve_edge_connection(tcp_stream, app, peer_addr));
                }
            }
        }
    }

    /// Public OIDC hints for the browser PKCE client (issuer + client id from env).
    fn serve_oidc_browser_config() -> axum::response::Response {
        let enforce = std::env::var(OIDC_ENFORCE_ENV)
            .map(|v| v == "1" || v.eq_ignore_ascii_case("true"))
            .unwrap_or(false);
        let issuer = std::env::var(OIDC_ISSUER_ENV).ok().filter(|s| !s.is_empty());
        let client_id = std::env::var(OIDC_AUDIENCE_ENV).ok().filter(|s| !s.is_empty());
        let body = match issuer {
            Some(issuer) => serde_json::json!({
                "enforce": enforce,
                "issuer": issuer,
                "clientId": client_id.unwrap_or_default(),
            }),
            None => serde_json::json!({ "enforce": false }),
        };
        axum::response::Response::builder()
            .status(StatusCode::OK)
            .header(header::CONTENT_TYPE, "application/json; charset=utf-8")
            .header(header::CACHE_CONTROL, "no-cache")
            .body(Body::from(body.to_string()))
            .unwrap_or_else(|_| StatusCode::INTERNAL_SERVER_ERROR.into_response())
    }

    /// JSON document for Crossmint `animation_url` linked metadata (see Crossmint define-metadata).
    fn serve_tacvoice_entry_linked_json(query: Option<&str>) -> axum::response::Response {
        use axum::body::Body;
        use axum::http::header;
        use axum::http::{HeaderValue, StatusCode};
        use axum::response::IntoResponse;

        let (mint_ref, sha256) = parse_entry_linked_query(query);
        let body = serde_json::json!({
            "name": "TacVoice entry linked data",
            "description": "Binary payload is not embedded in on-chain NFT metadata; verify bytes with content_integrity.sha256.",
            "schema": "https://start.voice-lock.com/schemas/tacvoice-entry-linked/v1.json",
            "mint_ref": mint_ref,
            "content_integrity": { "sha256": sha256 },
        });
        axum::response::Response::builder()
            .status(StatusCode::OK)
            .header(header::CONTENT_TYPE, "application/json; charset=utf-8")
            .header(
                header::ACCESS_CONTROL_ALLOW_ORIGIN,
                HeaderValue::from_static("*"),
            )
            .body(Body::from(body.to_string()))
            .unwrap_or_else(|_| StatusCode::INTERNAL_SERVER_ERROR.into_response())
    }

    fn parse_entry_linked_query(query: Option<&str>) -> (String, String) {
        let mut mint_ref = String::new();
        let mut sha256 = String::new();
        let Some(q) = query else {
            return (mint_ref, sha256);
        };
        for part in q.split('&') {
            let Some((k, v)) = part.split_once('=') else {
                continue;
            };
            let k = k.trim();
            if k != "mint_ref" && k != "sha256" {
                continue;
            }
            let decoded = decode_query_component(v);
            if decoded.len() > 512 {
                continue;
            }
            if k == "mint_ref" {
                mint_ref = decoded;
            } else {
                sha256 = decoded;
            }
        }
        (mint_ref, sha256)
    }

    fn decode_query_component(input: &str) -> String {
        let mut out = String::with_capacity(input.len());
        let mut chars = input.chars().peekable();
        while let Some(c) = chars.next() {
            if c == '%' {
                let a = chars.next();
                let b = chars.next();
                if let (Some(ca), Some(cb)) = (a, b) {
                    if let (Some(d1), Some(d2)) = (ca.to_digit(16), cb.to_digit(16)) {
                        let code = ((d1 as u8) << 4) | (d2 as u8);
                        if code <= 127 {
                            if let Some(ch) = char::from_u32(code as u32) {
                                out.push(ch);
                                continue;
                            }
                        }
                    }
                }
                out.push('%');
                continue;
            }
            if c == '+' {
                out.push(' ');
            } else {
                out.push(c);
            }
        }
        out
    }

    /// Returns the tactical message catalog as JSON, scoped to the caller's Entity.
    /// With no auth context (legacy path) the full catalog is returned unfiltered.
    fn serve_message_catalog(auth: Option<&AuthContext>) -> axum::response::Response {
        let groups = scoped_groups(auth);
        let count: usize = groups.iter().map(|g| g.messages.len()).sum();
        println!("[messages] serving catalog.json ({} messages)", count);
        match serde_json::to_vec(&groups) {
            Ok(bytes) => axum::response::Response::builder()
                .status(StatusCode::OK)
                .header(header::CONTENT_TYPE, "application/json; charset=utf-8")
                .header(header::CACHE_CONTROL, "no-cache")
                .body(Body::from(bytes))
                .unwrap_or_else(|_| StatusCode::INTERNAL_SERVER_ERROR.into_response()),
            Err(e) => {
                eprintln!("[messages] catalog serialize failed: {}", e);
                StatusCode::INTERNAL_SERVER_ERROR.into_response()
            }
        }
    }

    /// Returns one tactical message form as JSON for the `number` query param.
    /// Enforces Entity gating and location redaction when an auth context is present.
    fn serve_message_form(query: Option<&str>, auth: Option<&AuthContext>) -> axum::response::Response {
        let number = parse_query_param(query, "number");
        let Some(number) = number.filter(|n| !n.is_empty()) else {
            return StatusCode::BAD_REQUEST.into_response();
        };
        let entity = auth.and_then(|a| a.entity.as_deref());
        let Some(group_kind) = message_group_kind(&number) else {
            return StatusCode::NOT_FOUND.into_response();
        };
        if !entity_allows_group(entity, &group_kind) {
            return StatusCode::FORBIDDEN.into_response();
        }
        match messages::catalog().get_message_form(&number) {
            Some(msg) => {
                let mut msg = msg.clone();
                if redact_location_for(auth) {
                    redact_message_location(&mut msg);
                }
                match serde_json::to_vec(&msg) {
                    Ok(bytes) => axum::response::Response::builder()
                        .status(StatusCode::OK)
                        .header(header::CONTENT_TYPE, "application/json; charset=utf-8")
                        .header(header::CACHE_CONTROL, "no-cache")
                        .body(Body::from(bytes))
                        .unwrap_or_else(|_| StatusCode::INTERNAL_SERVER_ERROR.into_response()),
                    Err(e) => {
                        eprintln!("[messages] form serialize failed for '{}': {}", number, e);
                        StatusCode::INTERNAL_SERVER_ERROR.into_response()
                    }
                }
            }
            None => StatusCode::NOT_FOUND.into_response(),
        }
    }

    /// Extracts a bearer token from the Authorization header or `access_token` cookie.
    /// Returns None when neither carries a token.
    fn extract_bearer_token(req: &axum::http::Request<axum::body::Body>) -> Option<String> {
        if let Some(auth) = req.headers().get(header::AUTHORIZATION) {
            if let Ok(s) = auth.to_str() {
                if let Some(tok) = s.strip_prefix("Bearer ") {
                    return Some(tok.trim().to_string());
                }
            }
        }
        let cookies = req.headers().get(header::COOKIE)?.to_str().ok()?;
        for part in cookies.split(';') {
            if let Some((k, v)) = part.trim().split_once('=') {
                if k == "access_token" {
                    return Some(v.trim().to_string());
                }
            }
        }
        None
    }

    /// Resolves the auth context for protected message endpoints.
    /// Returns Err(401) when OIDC enforcement is on and no valid token is present.
    async fn resolve_message_auth(
        state: &Arc<TacVoiceServerState>,
        token: Option<String>,
    ) -> Result<Option<AuthContext>, axum::response::Response> {
        let Some(verifier) = state.verifier.as_ref() else {
            return Ok(None);
        };
        match token {
            Some(token) => match verifier.authorize(&token).await {
                Ok(ctx) => Ok(Some(ctx)),
                Err(e) => {
                    eprintln!("[auth] token rejected: {}", e);
                    if verifier.enforce() {
                        Err(StatusCode::UNAUTHORIZED.into_response())
                    } else {
                        Ok(None)
                    }
                }
            },
            None => {
                if verifier.enforce() {
                    Err(StatusCode::UNAUTHORIZED.into_response())
                } else {
                    Ok(None)
                }
            }
        }
    }

    /// True when the message group `kind` matches a staff-section Entity name.
    /// Sectioned entities only see their own group; others see all groups.
    fn is_sectioned_entity(entity: &str) -> bool {
        messages::catalog()
            .groups
            .iter()
            .any(|g| g.kind.eq_ignore_ascii_case(entity))
    }

    /// Decides whether an Entity may view messages in the given group kind.
    fn entity_allows_group(entity: Option<&str>, kind: &str) -> bool {
        match entity {
            Some(e) if is_sectioned_entity(e) => kind.eq_ignore_ascii_case(e),
            _ => true,
        }
    }

    /// Returns the group kind (typeText) that owns the given message number.
    fn message_group_kind(number: &str) -> Option<String> {
        messages::catalog()
            .groups
            .iter()
            .find(|g| g.messages.iter().any(|m| m.number == number))
            .map(|g| g.kind.clone())
    }

    /// Location info is restricted to the Operations Entity (policy control-1).
    /// Redaction applies to any authenticated, non-Operations caller.
    fn redact_location_for(auth: Option<&AuthContext>) -> bool {
        match auth.and_then(|a| a.entity.as_deref()) {
            Some(e) => !e.eq_ignore_ascii_case("Operations"),
            None => false,
        }
    }

    /// Builds the Entity-scoped, possibly redacted catalog groups for a caller.
    fn scoped_groups(auth: Option<&AuthContext>) -> Vec<MessageGroup> {
        let entity = auth.and_then(|a| a.entity.as_deref());
        let redact = redact_location_for(auth);
        messages::catalog()
            .groups
            .iter()
            .filter(|g| entity_allows_group(entity, &g.kind))
            .map(|g| {
                let mut g = g.clone();
                if redact {
                    for msg in g.messages.iter_mut() {
                        redact_message_location(msg);
                    }
                }
                g
            })
            .collect()
    }

    /// Removes location-bearing lines and details from a message form template.
    fn redact_message_location(msg: &mut Message) {
        let mentions = |s: &str| s.to_lowercase().contains("location");
        msg.lines
            .retain(|l| !mentions(&l.info) && !mentions(&l.id));
        for line in msg.lines.iter_mut() {
            if let LineKind::Details(details) = &mut line.kind {
                details.retain(|d| !mentions(&d.info));
            }
        }
    }

    /// Reads a single URL query parameter value, if present.
    fn parse_query_param(query: Option<&str>, key: &str) -> Option<String> {
        let q = query?;
        for part in q.split('&') {
            let (k, v) = part.split_once('=')?;
            if k.trim() == key {
                return Some(decode_query_component(v));
            }
        }
        None
    }

    /// Request handler: message JSON APIs and embedded static assets from `www/`.
    async fn handle_request(
        Extension(state): Extension<Arc<TacVoiceServerState>>,
        req: axum::http::Request<axum::body::Body>,
    ) -> axum::response::Response {
        let mut path = req.uri().path().trim_start_matches('/').to_string();
        // Message catalog/form are entity-scoped: require OIDC when enforced, then
        // gate/redact by the caller's resolved policy Entity.
        if path == "messages/catalog.json" || path == "messages/form.json" {
            // Extract the token before awaiting: holding `&req` (Body is not Sync)
            // across an await would make the handler future non-Send.
            let token = extract_bearer_token(&req);
            let auth_ctx = match resolve_message_auth(&state, token).await {
                Ok(ctx) => ctx,
                Err(resp) => return resp,
            };
            if path == "messages/catalog.json" {
                return serve_message_catalog(auth_ctx.as_ref());
            }
            return serve_message_form(req.uri().query(), auth_ctx.as_ref());
        }
        if path == ".well-known/tacvoice/entry-linked.json" {
            return serve_tacvoice_entry_linked_json(req.uri().query());
        }
        if path == ".well-known/tacvoice/oidc.json" {
            return serve_oidc_browser_config();
        }
        // Serve static file from embedded `www/` only (same tree as upload_assets retains).
        if path.is_empty() {
            path = "index.html".to_string();
        }

        if !is_safe_asset_path(&path) {
            return axum::response::Response::builder()
                .status(StatusCode::NOT_FOUND)
                .body(Body::from("Not Found"))
                .unwrap_or_else(|_| StatusCode::NOT_FOUND.into_response());
        }

        let bytes = {
            let cache = state.static_cache.read().await;
            cache.get(&path).cloned()
        };
        let bytes = match bytes {
            Some(b) => b,
            None => {
                let b = get_web_asset(&path).ok().or_else(|| get_asset(&format!("www/{}", path)).ok());
                match b.filter(|v| !v.is_empty()) {
                    Some(b) => {
                        let mut cache = state.static_cache.write().await;
                        cache.insert(path.clone(), b.clone());
                        b
                    }
                    None => {
                        return axum::response::Response::builder()
                            .status(StatusCode::NOT_FOUND)
                            .body(Body::from("Not Found"))
                            .unwrap_or_else(|_| StatusCode::NOT_FOUND.into_response());
                    }
                }
            }
        };

        let content_type = content_type_for(&path);
        let cache_control = cache_control_for(&path);
        let mut builder = axum::response::Response::builder()
            .status(StatusCode::OK)
            .header(header::CONTENT_TYPE, content_type)
            .header(header::CONTENT_LENGTH, bytes.len())
            .header(header::CACHE_CONTROL, cache_control);
        if path.ends_with(".html") {
            builder = builder.header(header::PRAGMA, "no-cache");
        }
        builder
            .body(Body::from(bytes))
            .unwrap_or_else(|_| StatusCode::INTERNAL_SERVER_ERROR.into_response())
    }

    /// Rejects traversal and percent-encoded path tricks; static tree uses simple path characters.
    fn is_safe_asset_path(path: &str) -> bool {
        if path.contains('\\') || path.contains('%') || path.contains('\0') {
            return false;
        }
        !path.split('/').any(|seg| seg == "..")
    }

    /// Determine content type from file extension
    fn content_type_for(path: &str) -> &'static str {
        if path.ends_with(".html") {
            "text/html; charset=utf-8"
        } else if path.ends_with(".js") {
            "application/javascript; charset=utf-8"
        } else if path.ends_with(".wasm") {
            "application/wasm"
        } else if path.ends_with(".css") {
            "text/css; charset=utf-8"
        } else if path.ends_with(".json") {
            "application/json; charset=utf-8"
        } else if path.ends_with(".png") {
            "image/png"
        } else if path.ends_with(".jpg") || path.ends_with(".jpeg") {
            "image/jpeg"
        } else if path.ends_with(".svg") {
            "image/svg+xml"
        } else if path.ends_with(".ico") {
            "image/x-icon"
        } else if path.ends_with(".woff2") {
            "font/woff2"
        } else if path.ends_with(".woff") {
            "font/woff"
        } else if path.ends_with(".ttf") {
            "font/ttf"
        } else if path.ends_with(".gz") {
            "application/gzip"
        } else {
            "application/octet-stream"
        }
    }

    /// Cache-Control for PWA: long-lived for static assets, no-cache for HTML and sw.js
    fn cache_control_for(path: &str) -> &'static str {
        if path.ends_with(".html") || path.ends_with("sw.js") {
            "no-cache, must-revalidate"
        } else if path.ends_with(".js")
            || path.ends_with(".css")
            || path.ends_with(".wasm")
            || path.ends_with(".png")
            || path.ends_with(".ico")
            || path.ends_with(".json")
        {
            "public, max-age=31536000, immutable"
        } else {
            "public, max-age=86400"
        }
    }
}

#[cfg(not(target_arch = "wasm32"))]
#[tokio::main]
async fn main() {
    if let Err(e) = native::main_inner().await {
        eprintln!("Fatal error: {}", e);
        std::process::exit(1);
    }
}
