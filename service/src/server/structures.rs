use serde::{Deserialize, Serialize};

#[cfg(not(target_arch = "wasm32"))]
use zt_services::structures::{
    FileClient, KeyClient, LedgerClient, OrderwireClient, OversightClient, ServiceCfgType,
    MtlsInterface,
};
#[cfg(not(target_arch = "wasm32"))]
use std::collections::HashMap;
#[cfg(not(target_arch = "wasm32"))]
use std::sync::atomic::AtomicU32;
#[cfg(not(target_arch = "wasm32"))]
use std::sync::Arc;

/// TacVoiceServer  server
/// Manages server lifecycle, ZTXS connections, and asset uploads
#[cfg(not(target_arch = "wasm32"))]
#[derive(Clone)]
pub struct TacVoiceServer {
    pub server_id: String,
    pub name: String,
    pub cfg_map: HashMap<String, ServiceCfgType>,
    pub clients: ZTXSClients,
    pub server_interface: MtlsInterface,
    pub system_ledger: SystemOperationsLedger,
    /// Real-time statistics counters for dashboard
    pub stats: TacVoiceStats,
}

///  client connections for internal dashboard operations
#[cfg(not(target_arch = "wasm32"))]
#[derive(Clone)]
pub struct ZTXSClients {
    pub key_client: KeyClient,
    pub file_client: FileClient,
    pub ledger_client: LedgerClient,
    pub oversight_client: Option<OversightClient>,
    pub orderwire_client: Option<OrderwireClient>,
}

/// Helper for accessing ZTXS services through gRPC-Web gateway
#[cfg(not(target_arch = "wasm32"))]
pub struct GatewayClients {
    pub client_cfg: HashMap<String, ServiceCfgType>,
    pub server_cfg: ServiceCfgType,
    pub key_client: KeyClient,
}

/// API error response
#[derive(Debug, Serialize)]
pub struct ErrorResponse {
    pub error: String,
    pub code: String,
}

/// Server statistics for real-time tracking
#[cfg(not(target_arch = "wasm32"))]
#[derive(Clone)]
pub struct TacVoiceStats {
    pub total_recordings: Arc<AtomicU32>,
    pub total_submissions: Arc<AtomicU32>,
    pub total_startups: Arc<AtomicU32>,
    pub total_shutdowns: Arc<AtomicU32>,
}

/// Ledger backend: direct to LedgerServer or via OversightServer.
#[cfg(not(target_arch = "wasm32"))]
#[derive(Clone)]
pub struct SystemOperationsLedger {
    pub ledger_client: Option<LedgerClient>,
    pub orderwire_client: Option<OrderwireClient>,
    pub server_stats: Option<TacVoiceStats>,
}

/// Client for tacvoice server operations.
#[cfg(not(target_arch = "wasm32"))]
#[derive(Clone)]
pub struct TacVoiceClient {
    pub client_name: String,
    pub client_interface: MtlsInterface,
}

/// Transcriber service server; publishes browser transcriptions to Orderwire.
#[cfg(not(target_arch = "wasm32"))]
#[derive(Clone)]
pub struct TranscriberServer {
    pub name: String,
    pub server_interface: MtlsInterface,
    pub orderwire_client: OrderwireClient,
}

/// Client for the Transcriber service.
#[cfg(not(target_arch = "wasm32"))]
#[derive(Clone)]
pub struct TranscriberClient {
    pub name: String,
    pub client_interface: MtlsInterface,
}

/// Recognizer service server; publishes recognition results to Orderwire.
#[cfg(not(target_arch = "wasm32"))]
#[derive(Clone)]
pub struct RecognizerServer {
    pub name: String,
    pub server_interface: MtlsInterface,
    pub orderwire_client: OrderwireClient,
}

/// Client for the Recognizer service.
#[cfg(not(target_arch = "wasm32"))]
#[derive(Clone)]
pub struct RecognizerClient {
    pub name: String,
    pub client_interface: MtlsInterface,
}

/// Sentence/transcription pair captured during a voiceprint session.
#[derive(Debug, Clone, Serialize, Deserialize, Default)]
#[serde(default)]
pub struct VoiceprintPhrase {
    pub sentence: String,
    pub transcription: String,
}

/// Voiceprint entry (`information_type = "voiceprint"`); GMM payload + sentence phrases.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(default)]
pub struct VoiceprintEntry {
    /// Per-entry id; matched by mint and listing flows.
    pub biometric_identifier: String,
    /// User-visible label captured from the publish form.
    pub entry_name: String,
    /// Mint description; required before mint, becomes NFT `metadata.description`.
    pub description: String,
    /// Voiceprint engine format label emitted by `VoicePrintResult::to_json` (`"1"`).
    pub version: String,
    /// Speaker id captured by the voiceprint engine at recording time.
    pub speaker_id: String,
    /// Voiceprint creation timestamp (milliseconds since epoch).
    pub created_at: u64,
    /// Voiceprint algorithm format version.
    pub algorithm_version: u8,
    /// Hex-encoded SHA-256 hash of the voiceprint payload.
    pub hash: String,
    /// Fuzzy similarity hash produced by the voiceprint engine.
    pub fuzzy_hash: String,
    /// Base64-encoded GMM model bytes.
    pub gmm_bytes: String,
    /// Byte length of the decoded GMM model.
    pub size: u64,
    /// Captured sentence/transcription pairs from the voiceprint session.
    pub phrases: Vec<VoiceprintPhrase>,
    /// Base64 of the uploaded file bytes; consumed for SHA256 hash and linked-blob upload.
    pub file_data_base64: String,
    /// MIME type of the uploaded file; required by the linked-blob register before mint.
    pub file_content_type: String,
    /// Per-entry credit cost; required (>0) before publish.
    pub credit_cost: u64,
    /// Mint lifecycle: `local`, `pending`, `minting`, `minted`, `failed`.
    pub publish_status: String,
}

impl Default for VoiceprintEntry {
    fn default() -> Self {
        Self {
            biometric_identifier: String::new(),
            entry_name: String::new(),
            description: String::new(),
            version: String::new(),
            speaker_id: String::new(),
            created_at: 0,
            algorithm_version: 0,
            hash: String::new(),
            fuzzy_hash: String::new(),
            gmm_bytes: String::new(),
            size: 0,
            phrases: Vec::new(),
            file_data_base64: String::new(),
            file_content_type: String::new(),
            credit_cost: 0,
            publish_status: String::new(),
        }
    }
}

