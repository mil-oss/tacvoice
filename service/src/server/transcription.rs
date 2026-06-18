use serde::{Deserialize, Serialize};

/// Transcription result captured by the browser STT and published to Orderwire.
/// Carries recognized text plus identifying metadata for downstream consumers.
#[derive(Debug, Clone, Serialize, Deserialize, Default)]
#[serde(default)]
pub struct Transcription {
    pub id: String,
    pub callsign: String,
    pub message_number: String,
    pub text: String,
    pub created_at: u64,
}

impl Transcription {
    /// Creates an empty transcription with default field values.
    /// Used as a placeholder before population.
    pub fn new() -> Self {
        Self::default()
    }
}
