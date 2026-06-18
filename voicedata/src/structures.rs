use serde::{Deserialize, Serialize};

#[cfg(target_arch = "wasm32")]
use wasm_bindgen::prelude::*;

/// GMM and voiceprint configuration parameters
///
/// Centralized configuration for all tunable parameters used in GMM training,
/// voiceprint comparison, and LLR scoring. Adjust these values to fine-tune
/// the voiceprint matching behavior.

pub struct GmmVoiceprintParameters {
    pub min_variance: f32,
    pub llr_threshold_very_negative: f32,
    pub llr_threshold_negative: f32,
    pub llr_threshold_moderate: f32,
    pub llr_threshold_less_negative: f32,
    pub llr_score_very_negative_min: f32,
    pub llr_score_very_negative_max: f32,
    pub llr_score_negative_min: f32,
    pub llr_score_negative_max: f32,
    pub llr_score_moderate_min: f32,
    pub llr_score_moderate_max: f32,
    pub llr_score_less_negative_min: f32,
    pub llr_score_less_negative_max: f32,
    pub llr_score_near_zero_min: f32,
    pub llr_score_near_zero_max: f32,
    pub llr_normalization_lower_bound: f32,
    pub llr_normalization_upper_bound: f32,
    pub fuzzy_hash_sensitivity_factor: f32,
    pub fuzzy_hash_min_threshold: u32,
}

/// Application state manager (WASM version)
#[cfg(target_arch = "wasm32")]
#[wasm_bindgen]
pub struct AppState {
    #[wasm_bindgen(skip)]
    pub sentences: Vec<String>,
    pub current_sentence_index: usize,
    #[wasm_bindgen(skip)]
    pub recordings: Vec<RecordingData>,
    #[wasm_bindgen(skip)]
    pub voiceprints: Vec<VoiceprintData>,
}

/// Recording data structure
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct RecordingData {
    pub sentence_index: usize,
    pub transcribed_text: String,
    pub match_likelihood: Option<f64>,
    pub fuzzy_hash_score: Option<f64>,
}

/// Voiceprint data structure
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct VoiceprintData {
    pub hash: String,
    pub voiceprint_bytes: Vec<u8>,
}

/// API success response
#[derive(Debug, Serialize)]
pub struct SuccessResponse<T> {
    pub success: bool,
    pub data: T,
}

/// Health check response
#[derive(Debug, Serialize)]
pub struct HealthResponse {
    pub status: String,
    pub version: String,
    pub timestamp: u64,
}

/// Quote request
#[derive(Debug, Deserialize)]
pub struct QuoteRequest {
    pub operation: String, // "voiceprint" or "verification"
}

/// Quote response
#[derive(Debug, Serialize)]
pub struct QuoteResponse {
    pub quote: String,
}

/// Voiceprint request
#[derive(Debug, Deserialize)]
pub struct VoiceprintRequest {
    pub client_pubkey: String,
    pub voice_print_data: String, // Base64 encoded voice-print
    pub payment_method: String,
    pub payment_signature: Option<String>, // Pre-paid transaction signature
}

/// Voiceprint response
#[derive(Debug, Serialize)]
pub struct VoiceprintResponse {
    pub blockchain_address: String,
    pub payment_signature: String,
    pub registry_pda: String,
}

/// Verification request
#[derive(Debug, Deserialize)]
pub struct VerificationRequest {
    pub owner_pubkey: String,
    pub client_pubkey: String,
    pub challenge_voice_print_data: String, // Base64 encoded
    pub payment_method: String,
    pub payment_signature: Option<String>,
}

/// Verification response
#[derive(Debug, Serialize)]
pub struct VerificationResponse {
    pub is_match: bool,
    pub confidence: f32,
    pub blockchain_signature: String,
    pub payment_signature: String,
}

/// Recording state
#[cfg(target_arch = "wasm32")]
#[wasm_bindgen]
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum RecordingState {
    Idle,
    Recording,
    Processing,
    Stopped,
}

/// Audio recorder for capturing microphone input in the browser
#[cfg(target_arch = "wasm32")]
pub struct WebAudioRecorder {
    pub audio_context: web_sys::AudioContext,
    pub stream: Option<web_sys::MediaStream>,
    pub samples: std::rc::Rc<std::cell::RefCell<Vec<f32>>>,
    pub is_recording: bool,
}

/// WASM-bindgen wrapper for audio recording
#[cfg(target_arch = "wasm32")]
#[wasm_bindgen]
pub struct AudioRecorder {
    #[wasm_bindgen(skip)]
    pub recorder: Option<WebAudioRecorder>,
}

/// Recording session for managing audio recording state
#[cfg(target_arch = "wasm32")]
#[wasm_bindgen]
pub struct RecordingSession {
    pub state: RecordingState,
    pub start_time: Option<f64>,
    pub samples_count: usize,
}

#[cfg(target_arch = "wasm32")]
#[wasm_bindgen]
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum VoiceprintState {
    Idle,
    Recording,
    Processing,
    Completed,
}

/// Voiceprint manager that orchestrates the voiceprint workflow
#[cfg(target_arch = "wasm32")]
#[wasm_bindgen]
pub struct VoiceprintManager {
    #[wasm_bindgen(skip)]
    pub session: Option<VoiceprintSession>,
    pub state: VoiceprintState,
    #[wasm_bindgen(skip)]
    pub speaker_id: String,
    pub recordings_count: usize,
    pub current_sentence_index: usize,
}

/// Voiceprint workflow coordinator
#[cfg(target_arch = "wasm32")]
#[wasm_bindgen]
pub struct VoiceprintWorkflow {
    #[wasm_bindgen(skip)]
    pub voiceprint_manager: Option<VoiceprintManager>,
    #[wasm_bindgen(skip)]
    pub app_state: AppState,
    #[wasm_bindgen(skip)]
    pub speaker_id: String,
}

/// Voiceprint session for collecting multiple recordings
#[cfg(target_arch = "wasm32")]
#[wasm_bindgen]
pub struct VoiceprintSession {
    #[wasm_bindgen(skip)]
    pub speaker_id: String,
    #[wasm_bindgen(skip)]
    pub ubm: Option<GmmParameters>,
    #[wasm_bindgen(skip)]
    pub current_voiceprint: Option<VoicePrintResult>,
    /// Fuzzy hash of the current voiceprint (for comparison)
    #[wasm_bindgen(skip)]
    pub current_fuzzy_hash: Option<String>,
    pub processed_recordings_count: usize,
    pub total_frames_processed: usize,
    /// Adaptive gain reduction factor (starts at 1.0, reduces if clipping detected)
    pub adaptive_gain: f32,
    /// Average noise floor estimate from previous recordings
    pub noise_floor_estimate: f32,
    /// Average frames per recording (for normalizing contributions)
    pub average_frames_per_recording: f32,
}

/// Result of voiceprint comparison
#[cfg(target_arch = "wasm32")]
#[wasm_bindgen]
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ComparisonResult {
    #[wasm_bindgen(skip)]
    pub llr_score: f32,
    #[wasm_bindgen(skip)]
    pub fuzzy_hash_score: Option<f32>,
    #[wasm_bindgen(skip)]
    pub raw_llr: f32,
}

#[cfg(target_arch = "wasm32")]
#[wasm_bindgen]
impl ComparisonResult {
    #[wasm_bindgen(getter)]
    pub fn llr_score(&self) -> f32 {
        self.llr_score
    }

    #[wasm_bindgen(getter)]
    pub fn fuzzy_hash_score(&self) -> Option<f32> {
        self.fuzzy_hash_score
    }

    #[wasm_bindgen(getter)]
    pub fn raw_llr(&self) -> f32 {
        self.raw_llr
    }
}

/// Result of voiceprint containing the voiceprint data
#[cfg(target_arch = "wasm32")]
#[wasm_bindgen]
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct VoicePrintResult {
    #[wasm_bindgen(skip)]
    pub hash: Vec<u8>,
    #[wasm_bindgen(skip)]
    pub gmm_bytes: Vec<u8>,
    #[wasm_bindgen(skip)]
    pub speaker_id: String,
    #[wasm_bindgen(skip)]
    pub fuzzy_hash: Option<String>,
    /// Unix-millisecond timestamp of when the voiceprint was created
    pub created_at: u64,
    /// Algorithm version for forward-compatibility of verifiers
    pub algorithm_version: u8,
}

/// Voice-print structure containing GMM parameters
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct VoicePrint {
    pub speaker_id: String,
    pub ubm: GmmParameters,
    pub gmm_params: GmmParameters,
    pub metadata: VoiceprintMetadata,
}

/// GMM parameters (means, covariances, weights)
/// NOTE: Field order matters for MessagePack serialization - do not reorder fields
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GmmParameters {
    pub means: Vec<Vec<f32>>,       // n_components × feature_dim
    pub covariances: Vec<Vec<f32>>, // n_components × feature_dim (diagonal)
    pub weights: Vec<f32>,          // n_components
    pub n_components: usize,
    pub feature_dim: usize,
}

/// Voiceprint metadata
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct VoiceprintMetadata {
    pub voiceprint_date: u64,
    pub phrases_used: Vec<String>,
    pub audio_duration_secs: f32,
    pub num_frames: usize,
    pub algorithm_version: u8,
}
