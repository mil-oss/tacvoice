//! TacVoice  Server
//!
use crate::config::*;
use crate::server::error::{Result, TacVoiceError};
use crate::server::structures::{
    GatewayClients, TacVoiceStats, SystemOperationsLedger, TacVoiceClient, TacVoiceServer,
    ZTXSClients,
};
use futures::prelude::*;
use zt_services::client_service::{mtls_client_interface, mtls_server_interface};
use zt_services::mtls_service::RpcCache;
use zt_services::network_service::{self, interface_key};
use zt_services::structures::{
    FileClient, KeyClient, LedgerClient, OrderwireClient, OversightClient, ServiceCfgType,
    MtlsInterface,
};
use zt_services::mtls_service;
use zt_services::orderwire_service::OrderwireMessage;
use std::collections::HashMap;
use std::error::Error;
use std::io;
use std::sync::atomic::{AtomicU32, Ordering};
use std::sync::{Arc, OnceLock};
use tacvoice_client::logmeta::{RecordingMeta, SubmissionMeta};
use tarpc::context::Context;
use tarpc::server::{BaseChannel, Channel};
use tarpc::tokio_util::codec::length_delimited::LengthDelimitedCodec;
use tokio::net::TcpListener;
use tokio_util::codec::Framed;
use zt_gateway::service_gateways::tacvoice_gateway::TacVoiceClientOps;
use zt_strcts::policy_strct::{DeviceType, PolicyType};
use ztlb::message::RmpFormat;
use ztlb::time_id::base62_id;

/// Debug flag for conditional printing.
const DBG: bool = true;

fn tacvoice_rpc_cache() -> &'static RpcCache<TacVoiceServiceClient> {
    static CACHE: OnceLock<RpcCache<TacVoiceServiceClient>> = OnceLock::new();
    CACHE.get_or_init(RpcCache::new)
}

/// Prints a debug message if the `DBG` constant is true.
fn dbg_println(msg: String) {
    if DBG {
        println!("[tacvoice]{}", msg);
    }
}

impl TacVoiceServer {
    /// Creates a new TacVoice server instance
    pub async fn new(name: String, policy: PolicyType) -> Result<Self> {
        // 1. Extract service configuration map
        let cfg_map = Self::config_map(policy.clone())?;
        // 2. Initialize  tacvoice server and client configurations
        let tacvoice_server_cfg = cfg_map
            .get(&TACVOICE_SERVICE.to_string())
            .ok_or_else(|| {
                TacVoiceError::ConfigurationError(
                    "TacVoiceService configuration not found".to_string(),
                )
            })?
            .clone();
        let tacvoice_client_cfg = cfg_map
            .get(&TACVOICE_CLIENT.to_string())
            .ok_or_else(|| {
                TacVoiceError::ConfigurationError(
                    "TacVoiceClient configuration not found".to_string(),
                )
            })?
            .clone();
        let clients = Self::init_clients(&cfg_map).await?;
        // 3. Create server interface for tarpc listener
        let client_ip = tacvoice_client_cfg
            .ip_address_text
            .clone()
            .unwrap_or_else(|| "0.0.0.0".to_string());
        let allowed_addresses = vec![(
            client_ip,
            tacvoice_client_cfg.service_port_numeric.ok_or_else(|| {
                TacVoiceError::ConfigurationError("Client service port not configured".to_string())
            })?,
        )];
        let server_interface = mtls_server_interface(&tacvoice_server_cfg, allowed_addresses)
            .map_err(|e| TacVoiceError::ConfigurationError(e))?;

        let stats = TacVoiceStats {
            total_recordings: Arc::new(AtomicU32::new(0)),
            total_submissions: Arc::new(AtomicU32::new(0)),
            total_startups: Arc::new(AtomicU32::new(0)),
            total_shutdowns: Arc::new(AtomicU32::new(0)),
        };

        let system_ledger = SystemOperationsLedger::new(
            clients.ledger_client.clone(),
            clients.orderwire_client.clone(),
            Some(stats.clone()),
        );

        Ok(Self {
            server_id: base62_id(),
            name,
            cfg_map,
            clients,
            server_interface,
            system_ledger,
            stats,
        })
    }

    /// Starts the mTLS interface and begins listening for tacvoice service requests.
    pub async fn start_interface(&mut self) -> std::result::Result<(), Box<dyn Error>> {
        dbg_println(format!(
            "Starting mTLS interface: {}",
            self.server_interface.name
        ));
        self.server_interface.start_interface().await?;
        dbg_println(format!("mTLS interface started, starting listener..."));
        self.listen().await?;
        Ok(())
    }

    /// Stops the mTLS interface and halts the tacvoice service.
    pub async fn stop_interface(&self) -> std::result::Result<(), Box<dyn Error>> {
        dbg_println(format!("Stop Server Interface {}", self.name));
        self.server_interface.stop_interface().await?;
        Ok(())
    }

    /// Listens for incoming TCP connections and spawns handlers for tacvoice service requests.
    pub async fn listen(&self) -> std::result::Result<(), Box<dyn Error>> {
        let listener = TcpListener::bind(format!(
            "{}:{}",
            self.server_interface.address.0, self.server_interface.address.1
        ))
        .await
        .map_err(|e| {
            Box::new(io::Error::new(
                io::ErrorKind::AddrNotAvailable,
                format!(
                    "Failed to bind to {}:{}: {}",
                    self.server_interface.address.0, self.server_interface.address.1, e
                ),
            ))
        })?;

        dbg_println(format!(
            "Listening on {}:{}",
            self.server_interface.address.0, self.server_interface.address.1
        ));

        let server_instance = self.clone();
        let allowed = self.server_interface.allowed_addr.clone();
        // Run the accept loop directly (this blocks forever, which is what we want)
        loop {
            let tcp = match network_service::accept_allowed(&listener, &allowed).await {
                Ok((tcp, _)) => tcp,
                Err(e) => {
                    eprintln!("{}", e);
                    continue;
                }
            };
            let server_instance = server_instance.clone();
            let fut = async move {
                let tcp = match mtls_service::wrap_server(tcp).await {
                    Ok(s) => s,
                    Err(e) => {
                        eprintln!("mTLS accept error: {}", e);
                        return;
                    }
                };
                let length_delimited = Framed::new(tcp, LengthDelimitedCodec::new());
                let transport = tarpc::serde_transport::new(length_delimited, RmpFormat);
                BaseChannel::with_defaults(transport)
                    .execute(server_instance.serve())
                    .for_each(spawn)
                    .await;
            };
            tokio::spawn(fut);
        }
    }

    /// Extracts service configuration map from policy
    fn config_map(policy: PolicyType) -> Result<HashMap<String, ServiceCfgType>> {
        // Create device lookup map
        let mut device_map = HashMap::<String, DeviceType>::new();
        let devices = policy
            .devices
            .ok_or_else(|| {
                TacVoiceError::PolicyError("Policy devices not configured".to_string())
            })?
            .device
            .clone();

        for device in devices {
            if let Some(name) = &device.name_text {
                device_map.insert(name.clone(), device.clone());
            }
        }

        // Create service configuration map, merging device and service data
        let mut service_map = HashMap::<String, ServiceCfgType>::new();
        let services = policy
            .services
            .ok_or_else(|| {
                TacVoiceError::PolicyError("Policy services not configured".to_string())
            })?
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
                        key_name_text: service.key_name_text.clone(),
                        interface_text: service.interface_text.clone(),
                        device_name_text: device.clone().name_text,
                        ip_address_text: device.clone().ip_address_text,
                        service_port_numeric: service
                            .service_port_numeric
                            .and_then(|port| port.parse::<u16>().ok()),
                        description_text: service.description_text.clone(),
                        label_text: device.clone().label_text,
                        policy_id_text: service.policy_id_text.clone(),
                    };
                    if let Some(service_name) = &service.name_text {
                        service_map.insert(service_name.clone(), service_cfg);
                    }
                } else {
                    dbg_println(format!("Device not found: {}", device_name_text));
                }
            }
        }

        Ok(service_map)
    }

    /// Connects to ZTXS KeyService infrastructure
    async fn connect_to_ztxs_key_service(
        cfg_map: &HashMap<String, ServiceCfgType>,
    ) -> Result<KeyClient> {
        let key_client_cfg = cfg_map
            .get(&KEY_CLIENT.to_string())
            .ok_or_else(|| {
                TacVoiceError::ConfigurationError(
                    "TacVoice key client configuration not found".to_string(),
                )
            })?
            .clone();

        let key_server_cfg = cfg_map
            .get(&KEY_SERVICE.to_string())
            .ok_or_else(|| {
                TacVoiceError::ConfigurationError("Key server configuration not found".to_string())
            })?
            .clone();

        // Create MtlsInterface with client config pointing to server
        let client_interface = mtls_client_interface(&key_client_cfg, &key_server_cfg).map_err(
            |e| TacVoiceError::ServiceConnectionError(format!("Key client interface: {}", e)),
        )?;

        Ok(KeyClient::new(
            key_client_cfg
                .service_name_text
                .unwrap_or_else(|| KEY_CLIENT.to_string()),
            client_interface,
        ))
    }

    /// Initializes all  clients
    async fn init_clients(cfg_map: &HashMap<String, ServiceCfgType>) -> Result<ZTXSClients> {
        let key_client = Self::connect_to_ztxs_key_service(&cfg_map).await?;
        let file_client_cfg = cfg_map
            .get(&FILE_CLIENT.to_string())
            .ok_or_else(|| {
                TacVoiceError::ConfigurationError(
                    "TacVoice file client configuration not found".to_string(),
                )
            })?
            .clone();
        let file_server_cfg = cfg_map
            .get(&FILE_SERVICE.to_string())
            .ok_or_else(|| {
                TacVoiceError::ConfigurationError(
                    "TacVoice file server configuration not found".to_string(),
                )
            })?
            .clone();

        let file_client_interface =
            mtls_client_interface(&file_client_cfg, &file_server_cfg).map_err(|e| {
                TacVoiceError::ServiceConnectionError(format!("File client interface: {}", e))
            })?;
        let file_client = FileClient::new(
            file_client_cfg
                .service_name_text
                .unwrap_or_else(|| FILE_CLIENT.to_string()),
            file_client_interface,
        );
        let ledger_client_cfg = cfg_map
            .get(&TACVOICE_LEDGER_CLIENT.to_string())
            .ok_or_else(|| {
                TacVoiceError::ConfigurationError(
                    "TacVoice ledger client configuration not found".to_string(),
                )
            })?
            .clone();
        let ledger_server_cfg = cfg_map
            .get(&LEDGER_SERVICE.to_string())
            .ok_or_else(|| {
                TacVoiceError::ConfigurationError(
                    "TacVoice ledger server configuration not found".to_string(),
                )
            })?
            .clone();
        let ledger_client_interface =
            mtls_client_interface(&ledger_client_cfg, &ledger_server_cfg).map_err(|e| {
                TacVoiceError::ServiceConnectionError(format!("Ledger client interface: {}", e))
            })?;
        let ledger_client = LedgerClient::new(
            ledger_client_cfg
                .service_name_text
                .unwrap_or_else(|| TACVOICE_LEDGER_CLIENT.to_string()),
            ledger_client_interface,
        );
        let orderwire_client = cfg_map
            .get(&ORDERWIRE_CLIENT.to_string())
            .and_then(|orderwire_client_cfg| {
                cfg_map
                    .get(&ORDERWIRE_SERVICE.to_string())
                    .map(|orderwire_server_cfg| {
                        let orderwire_client_interface =
                            mtls_client_interface(orderwire_client_cfg, orderwire_server_cfg)
                                .unwrap_or_else(|_| {
                                    MtlsInterface::new(
                                        orderwire_client_cfg
                                            .interface_text
                                            .clone()
                                            .unwrap_or_default(),
                                        (
                                            orderwire_client_cfg
                                                .ip_address_text
                                                .clone()
                                                .unwrap_or_default(),
                                            orderwire_client_cfg
                                                .service_port_numeric
                                                .unwrap_or(0),
                                        ),
                                        vec![(
                                            orderwire_server_cfg
                                                .ip_address_text
                                                .clone()
                                                .unwrap_or_default(),
                                            orderwire_server_cfg.service_port_numeric.unwrap_or(0),
                                        )],
                                    )
                                });
                        OrderwireClient::new(
                            orderwire_client_cfg
                                .service_name_text
                                .clone()
                                .unwrap_or_else(|| ORDERWIRE_CLIENT.to_string()),
                            orderwire_client_interface,
                        )
                    })
            });
        let oversight_client = cfg_map
            .get(&OVERSIGHT_CLIENT.to_string())
            .and_then(|oc_cfg| {
                cfg_map.get(&OVERSIGHT_SERVICE.to_string()).map(|os_cfg| {
                    let oc_interface =
                        mtls_client_interface(oc_cfg, os_cfg).unwrap_or_else(|_| {
                            MtlsInterface::new(
                                oc_cfg.interface_text.clone().unwrap_or_default(),
                                (
                                    oc_cfg.ip_address_text.clone().unwrap_or_default(),
                                    oc_cfg.service_port_numeric.unwrap_or(0),
                                ),
                                vec![(
                                    os_cfg.ip_address_text.clone().unwrap_or_default(),
                                    os_cfg.service_port_numeric.unwrap_or(0),
                                )],
                            )
                        });
                    OversightClient::new(
                        oc_cfg
                            .service_name_text
                            .clone()
                            .unwrap_or_else(|| OVERSIGHT_CLIENT.to_string()),
                        oc_interface,
                    )
                })
            });
        Ok(ZTXSClients {
            key_client,
            file_client,
            ledger_client,
            oversight_client,
            orderwire_client,
        })
    }

    /// Creates a GatewayClients helper for gateway access
    pub fn gateway_clients(&self) -> Result<GatewayClients> {
        let gateway_service_cfg = self
            .cfg_map
            .get(&GATEWAY_SERVICE.to_string())
            .ok_or_else(|| {
                TacVoiceError::ConfigurationError("Gateway service not found".to_string())
            })?
            .clone();

        Ok(GatewayClients::new(
            self.cfg_map.clone(),
            gateway_service_cfg,
            self.clients.key_client.clone(),
        ))
    }

    /// Creates a SystemOperationsLedger helper for logging and ping operations
    pub fn system_operations_ledger(&self) -> SystemOperationsLedger {
        SystemOperationsLedger::new(
            self.clients.ledger_client.clone(),
            self.clients.orderwire_client.clone(),
            Some(self.stats.clone()),
        )
    }

    /// Initialize stats from ledger entries on server startup
    pub async fn initialize_stats_from_ledger(&self) -> Result<()> {
        dbg_println("Initializing stats from ledger entries...".to_string());

        let Some(ref ow) = self.clients.orderwire_client else {
            return Ok(());
        };
        let entries = match self
            .clients
            .ledger_client
            .entry_data_list("ledger_entries".to_string())
            .await
        {
            Ok(path) => {
                let ready_path = format!("{}/ready", path);
                if let Err(e) = ow.receive_blocking(ready_path).await {
                    eprintln!("Failed to wait for ledger entries: {}", e);
                    return Ok(());
                }
                match ow.receive(path).await {
                    Ok(OrderwireMessage::LedgerEntryDataList(entries)) => entries,
                    _ => {
                        eprintln!("Failed to retrieve ledger entries");
                        return Ok(());
                    }
                }
            }
            Err(e) => {
                eprintln!("Failed to get ledger entries path: {}", e);
                return Ok(());
            }
        };

        // Count each activity type from ledger
        let mut recordings = 0u32;
        let mut submissions = 0u32;
        let mut startups = 0u32;
        let mut shutdowns = 0u32;

        for entry in entries {
            let content_str = String::from_utf8_lossy(&entry.content);
            // Check activity type from content or entry metadata
            if content_str.contains("recording") {
                recordings += 1;
            } else if content_str.contains("submission") {
                submissions += 1;
            } else if content_str.contains("startup") {
                startups += 1;
            } else if content_str.contains("shutdown") {
                shutdowns += 1;
            }
        }

        // Update atomic counters
        self.stats
            .total_recordings
            .store(recordings, Ordering::SeqCst);
        self.stats
            .total_submissions
            .store(submissions, Ordering::SeqCst);
        self.stats
            .total_startups
            .store(startups, Ordering::SeqCst);
        self.stats
            .total_shutdowns
            .store(shutdowns, Ordering::SeqCst);

        dbg_println(format!(
            "Stats initialized: recordings={}, submissions={}, startups={}, shutdowns={}",
            recordings, submissions, startups, shutdowns
        ));

        // Publish initial stats to orderwire
        self.system_ledger.publish_stats_to_orderwire().await?;

        Ok(())
    }

}

impl GatewayClients {
    pub fn new(
        client_cfg: HashMap<String, ServiceCfgType>,
        server_cfg: ServiceCfgType,
        key_client: KeyClient,
    ) -> Self {
        Self {
            client_cfg,
            server_cfg,
            key_client,
        }
    }

    /// Creates a FileClient configured for gateway access
    pub async fn get_file_client(&self) -> Result<FileClient> {
        // Use GATEWAY_FILE_CLIENT constant to lookup config
        let client_cfg = self
            .client_cfg
            .get(&GATEWAY_FILE_CLIENT.to_string())
            .ok_or_else(|| {
                TacVoiceError::ConfigurationError("Gateway file client not found".to_string())
            })?;

        // Get client name from policy config
        let client_name = client_cfg
            .service_name_text
            .as_ref()
            .ok_or_else(|| TacVoiceError::ConfigurationError("Client name missing".to_string()))?;

        // Create MtlsInterface with client config and server peer
        let client_addr = (
            client_cfg.ip_address_text.clone().unwrap_or_default(),
            client_cfg.service_port_numeric.unwrap_or(0),
        );
        let server_addr = (
            self.server_cfg.ip_address_text.clone().unwrap_or_default(),
            self.server_cfg.service_port_numeric.unwrap_or(0),
        );

        let interface = MtlsInterface::new(
            client_cfg.interface_text.clone().unwrap_or_default(),
            client_addr,
            vec![server_addr],
            );

        Ok(FileClient::new(client_name.clone(), interface))
    }

    /// Creates a LedgerClient configured for gateway access
    pub async fn get_ledger_client(&self) -> Result<LedgerClient> {
        // Use GATEWAY_LEDGER_CLIENT constant - same pattern as get_file_client
        let client_cfg = self
            .client_cfg
            .get(&GATEWAY_LEDGER_CLIENT.to_string())
            .ok_or_else(|| {
                TacVoiceError::ConfigurationError("Gateway ledger client not found".to_string())
            })?;

        let client_name = client_cfg
            .service_name_text
            .as_ref()
            .ok_or_else(|| TacVoiceError::ConfigurationError("Client name missing".to_string()))?;

        let client_addr = (
            client_cfg.ip_address_text.clone().unwrap_or_default(),
            client_cfg.service_port_numeric.unwrap_or(0),
        );
        let server_addr = (
            self.server_cfg.ip_address_text.clone().unwrap_or_default(),
            self.server_cfg.service_port_numeric.unwrap_or(0),
        );

        let interface = MtlsInterface::new(
            client_cfg.interface_text.clone().unwrap_or_default(),
            client_addr,
            vec![server_addr],
        );

        Ok(LedgerClient::new(client_name.clone(), interface))
    }

    /// Creates a KeyClient configured for gateway access
    pub async fn get_key_client(&self) -> Result<KeyClient> {
        // Use GATEWAY_KEY_CLIENT constant - same pattern
        let client_cfg = self
            .client_cfg
            .get(&GATEWAY_KEY_CLIENT.to_string())
            .ok_or_else(|| {
                TacVoiceError::ConfigurationError("Gateway key client not found".to_string())
            })?;

        let client_name = client_cfg
            .service_name_text
            .as_ref()
            .ok_or_else(|| TacVoiceError::ConfigurationError("Client name missing".to_string()))?;

        let client_addr = (
            client_cfg.ip_address_text.clone().unwrap_or_default(),
            client_cfg.service_port_numeric.unwrap_or(0),
        );
        let server_addr = (
            self.server_cfg.ip_address_text.clone().unwrap_or_default(),
            self.server_cfg.service_port_numeric.unwrap_or(0),
        );

        let interface = MtlsInterface::new(
            client_cfg.interface_text.clone().unwrap_or_default(),
            client_addr,
            vec![server_addr],
        );

        Ok(KeyClient::new(client_name.clone(), interface))
    }
}

/// System Operations Ledger for recording activities
///
/// Usage:
/// - log_startup()
/// - log_recording()
/// - log_submission()
/// - log_shutdown() ->
/// - log_activity()
/// - publish_stats_to_orderwire()
///
#[cfg(not(target_arch = "wasm32"))]
impl SystemOperationsLedger {
    pub fn new(
        ledger_client: LedgerClient,
        orderwire_client: Option<OrderwireClient>,
            server_stats: Option<TacVoiceStats>,
    ) -> Self {
        Self {
            ledger_client: Some(ledger_client),
            orderwire_client,
            server_stats,
        }
    }

    /// Log Startup
    pub async fn log_startup(&self) -> Result<()> {
        self.log_activity("startup", "startup".as_bytes().to_vec()).await
    }

    /// Log Recording
    pub async fn log_recording(&self, metadata: Vec<u8>) -> Result<()> {
        let result = self.log_activity("recording", metadata).await;
        if result.is_ok() {
            let _ = self.publish_stats_to_orderwire().await;
        }
        result
    }

    /// Log user access using cached ID (Step 2)
    pub async fn log_submission(&self,metadata: Vec<u8>) -> Result<()> {
        self.log_activity("submission", metadata)
            .await
    }

    /// Log server shutdown to the ledger.
    pub async fn log_shutdown(&self) -> Result<()> {
        self.log_activity("shutdown", "shutdown".as_bytes().to_vec())
            .await
    }

    /// Log a system operations activity to the ledger.
    pub async fn log_activity(&self, path: &str, content: Vec<u8>) -> Result<()> {
        let ledger_row_id = base62_id();
        let result = if let Some(ref lc) = self.ledger_client {
            lc.add_ledger_entry(ledger_row_id.clone(), content, path.to_string())
                .await
        } else {
            Err("No ledger backend configured".to_string())
        };
        if let Some(ref ow) = self.orderwire_client {
            if result.is_ok() {
                let msg = OrderwireMessage::Bool(true);
                if let Err(e) = ow.send(path.to_string(), msg).await {
                    eprintln!("[SystemOperationsLedger] orderwire notify failed: {}", e);
                }
            }
        }
        result.map_err(|e| TacVoiceError::ZtServiceError(format!("Ledger error: {}", e)))?;
        Ok(())
    }

    /// Publish current stats to orderwire for dashboard consumers.
    async fn publish_stats_to_orderwire(&self) -> Result<()> {
        if let (Some(ref ow), Some(ref stats)) = (&self.orderwire_client, &self.server_stats) {
            let stats_vec = vec![
                stats.total_recordings.load(Ordering::SeqCst),
                stats.total_submissions.load(Ordering::SeqCst),
                stats.total_startups.load(Ordering::SeqCst),
                stats.total_shutdowns.load(Ordering::SeqCst),
            ];
            let msg = OrderwireMessage::ULongList(stats_vec);
            if let Err(e) = ow.send(TACVOICE_STATS_PATH.to_string(), msg).await {
                eprintln!(
                    "[SystemOperationsLedger] Failed to publish stats to orderwire: {}",
                    e
                );
            }
        }
        Ok(())
    }
}

/// TacVoice service RPC interface.
#[tarpc::service]
pub trait TacVoiceService {
    /// Health check endpoint.
    async fn ping() -> std::result::Result<String, String>;
    async fn log_startup() -> std::result::Result<String, String>;
    async fn log_recording(metadata: Vec<u8>) -> std::result::Result<String, String>;
    async fn log_submission(metadata: Vec<u8>) -> std::result::Result<String, String>;
    async fn log_shutdown() -> std::result::Result<String, String>;
    /// Returns the JSON-serialized tactical message form for the given number.
    async fn get_message(number: String) -> std::result::Result<Vec<u8>, String>;
    /// Returns the JSON-serialized message catalog (groups with numbers and names).
    async fn get_catalog() -> std::result::Result<Vec<u8>, String>;
}

impl TacVoiceService for TacVoiceServer {
    /// Handles ping requests, returning a success message.
    async fn ping(self, _: Context) -> std::result::Result<String, String> {
        Ok("ok".to_owned())
    }
    /// Log startup. Returns immediately; ledger work runs in a spawned task.
    async fn log_startup(
        self,
        _: Context,
    ) -> std::result::Result<String, String> {
        let system_ledger = self.system_ledger.clone();
        tokio::spawn(async move {
            if let Err(e) = system_ledger.log_activity("startup", "startup".as_bytes().to_vec()).await {
                eprintln!("system_ledger.log_startup() failed: {}", e);
            }
        });
        Ok("Startup logged".to_string())
    }

    /// Log recording. Returns immediately; ledger work runs in a spawned task.
    async fn log_recording(self, _: Context, content: Vec<u8>) -> std::result::Result<String, String> {
        match serde_json::from_slice::<RecordingMeta>(&content) {
            Ok(meta) => dbg_println(format!(
                " recording: callsign={} size={}",
                meta.callsign, meta.size
            )),
            Err(_) => dbg_println(format!(" recording: {} bytes", content.len())),
        }
        let system_ledger = self.system_ledger.clone();
        tokio::spawn(async move {
            if let Err(e) = system_ledger.log_activity("recording", content).await {   
                eprintln!("system_ledger.log_recording() failed: {}", e);
            }
        });
        Ok("Recording logged".to_string())
    }

    /// Log submission. Returns immediately; ledger work runs in a spawned task.
    async fn log_submission(self, _: Context, metadata: Vec<u8>) -> std::result::Result<String, String> {
        match serde_json::from_slice::<SubmissionMeta>(&metadata) {
            Ok(meta) => dbg_println(format!(
                " submission: {} {} radio={} chat={}",
                meta.message_number, meta.message_name, meta.radio, meta.chat
            )),
            Err(_) => dbg_println(format!(" submission: {} bytes", metadata.len())),
        }
        let system_ledger = self.system_ledger.clone();
        tokio::spawn(async move {
            if let Err(e) = system_ledger.log_activity("submission", metadata).await {
                eprintln!("system_ledger.log_submission() failed: {}", e);
            }
        });
        Ok("Submission logged".to_string())
    }

    /// Log shutdown. Returns immediately; ledger work runs in a spawned task.
    async fn log_shutdown(self, _: Context) -> std::result::Result<String, String> {
        let system_ledger = self.system_ledger.clone();
        tokio::spawn(async move {
            if let Err(e) = system_ledger.log_activity("shutdown", "shutdown".as_bytes().to_vec()).await {
                eprintln!("system_ledger.log_shutdown() failed: {}", e);
            }
        });
        Ok("Shutdown logged".to_string())
    }

    /// Returns the JSON-serialized tactical message form, or an error if not found.
    async fn get_message(self, _: Context, number: String) -> std::result::Result<Vec<u8>, String> {
        match crate::server::messages::catalog().get_message_form(&number) {
            Some(msg) => serde_json::to_vec(msg)
                .map_err(|e| format!("Failed to serialize message '{}': {}", number, e)),
            None => Err(format!("Message '{}' not found", number)),
        }
    }

    /// Returns the JSON-serialized catalog groups for building selection menus.
    async fn get_catalog(self, _: Context) -> std::result::Result<Vec<u8>, String> {
        serde_json::to_vec(&crate::server::messages::catalog().groups)
            .map_err(|e| format!("Failed to serialize catalog: {}", e))
    }
}

/// Spawns a new asynchronous task.
async fn spawn(fut: impl std::future::Future<Output = ()> + Send + 'static) {
    tokio::spawn(fut);
}

impl TacVoiceClient {
    pub fn new(client_name: String, client_interface: MtlsInterface) -> Self {
        Self {
            client_name,
            client_interface,
        }
    }

    /// Establishes RPC connection to TacVoiceServer.
    async fn tacvoice_service_client(
        &self,
    ) -> std::result::Result<TacVoiceServiceClient, Box<dyn std::error::Error + Send + Sync>> {
        let iface = self.client_interface.clone();
        let cache_key = interface_key(&iface);
        tacvoice_rpc_cache()
            .get_or_connect(&cache_key, || async {
                let tcp = iface.connect_tcp().await?;
                let tcp = mtls_service::wrap_client(tcp)
                    .await
                    .map_err(|e| format!("mTLS client handshake failed: {}", e))?;
                let length_delimited = Framed::new(tcp, LengthDelimitedCodec::new());
                let transport = tarpc::serde_transport::new(length_delimited, RmpFormat);
                Ok(TacVoiceServiceClient::new(Default::default(), transport).spawn())
            })
            .await
            .map_err(|e: String| -> Box<dyn std::error::Error + Send + Sync> { e.into() })
    }

    /// Health check to verify TacVoice server connectivity.
    pub async fn ping(&self) -> std::result::Result<String, String> {
        dbg_println(format!("ping() called - connecting to TacVoiceServer"));
        match self.tacvoice_service_client().await {
            Ok(svce_client) => {
                let response = svce_client
                    .ping(tarpc::context::current())
                    .await
                    .map_err(|e| {
                        dbg_println(format!("ping() tarpc call failed: {}", e));
                        e.to_string()
                    })?;
                Ok(response?)
            }
            Err(e) => {
                dbg_println(format!("Failed to connect to TacVoiceServer: {}", e));
                Err(format!("Failed to connect to TacVoice service: {}", e))
            }
        }
    }

    /// Log user initiation
    pub async fn log_startup(
        &self,
    ) -> std::result::Result<String, String> {
        if let Ok(svce_client) = self.tacvoice_service_client().await {
            let response = svce_client
                .log_startup(tarpc::context::current())
                .await
                .map_err(|e| e.to_string())?;
            return Ok(response?);
        }
        Err("Failed to connect to TacVoice service".to_string())
    }

    /// Log recording
    pub async fn log_recording(&self, metadata: Vec<u8>) -> std::result::Result<String, String> {
        if let Ok(svce_client) = self.tacvoice_service_client().await {
            let response = svce_client
                .log_recording(tarpc::context::current(), metadata)
                .await
                .map_err(|e| e.to_string())?;
            return Ok(response?);
        }
        Err("Failed to connect to TacVoice service".to_string())
    }

    /// Log data upload
    pub async fn log_submission(&self, metadata: Vec<u8>) -> std::result::Result<String, String> {
        if let Ok(svce_client) = self.tacvoice_service_client().await {
            let response = svce_client
                .log_submission(tarpc::context::current(), metadata)
                .await
                .map_err(|e| e.to_string())?;
            return Ok(response?);
        }
        Err("Failed to connect to TacVoice service".to_string())
    }

    /// Log shutdown
    pub async fn log_shutdown(&self) -> std::result::Result<String, String> {
        if let Ok(svce_client) = self.tacvoice_service_client().await {
            let response = svce_client
                .log_shutdown(tarpc::context::current())
                .await
                .map_err(|e| e.to_string())?;
            return Ok(response?);
        }
        Err("Failed to connect to TacVoice service".to_string())
    }

    /// Retrieve a JSON-serialized tactical message form by number.
    pub async fn get_message(&self, number: String) -> std::result::Result<Vec<u8>, String> {
        if let Ok(svce_client) = self.tacvoice_service_client().await {
            let response = svce_client
                .get_message(tarpc::context::current(), number)
                .await
                .map_err(|e| e.to_string())?;
            return Ok(response?);
        }
        Err("Failed to connect to TacVoice service".to_string())
    }

    /// Retrieve the JSON-serialized message catalog for selection menus.
    pub async fn get_catalog(&self) -> std::result::Result<Vec<u8>, String> {
        if let Ok(svce_client) = self.tacvoice_service_client().await {
            let response = svce_client
                .get_catalog(tarpc::context::current())
                .await
                .map_err(|e| e.to_string())?;
            return Ok(response?);
        }
        Err("Failed to connect to TacVoice service".to_string())
    }
}

#[async_trait::async_trait]
impl TacVoiceClientOps for TacVoiceClient {

    async fn log_startup(&self) -> std::result::Result<String, String> {
        TacVoiceClient::log_startup(self).await
    }

    async fn log_recording(&self, metadata: Vec<u8>) -> std::result::Result<String, String> {
        TacVoiceClient::log_recording(self, metadata).await
    }

    async fn log_submission(&self, metadata: Vec<u8>) -> std::result::Result<String, String> {
        TacVoiceClient::log_submission(self, metadata).await
    }

    async fn log_shutdown(&self) -> std::result::Result<String, String> {
        TacVoiceClient::log_shutdown(self).await
    }

    async fn get_message_form(&self, number: String) -> std::result::Result<Vec<u8>, String> {
        TacVoiceClient::get_message(self, number).await
    }

    async fn get_catalog(&self) -> std::result::Result<Vec<u8>, String> {
        TacVoiceClient::get_catalog(self).await
    }

}
