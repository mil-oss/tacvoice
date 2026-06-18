use serde::{Deserialize, Serialize};

/// Speaker recognition result published to Orderwire by the recognizer.
/// Carries the match decision, score, and speaker identity.
#[derive(Debug, Clone, Serialize, Deserialize, Default)]
#[serde(default)]
pub struct RecognitionResult {
    pub id: String,
    pub speaker_id: String,
    pub matched: bool,
    pub score: f64,
    pub fuzzy_hash: String,
    pub created_at: u64,
}

impl RecognitionResult {
    /// Creates an empty recognition result with default field values.
    /// Used as a placeholder before population.
    pub fn new() -> Self {
        Self::default()
    }
}
