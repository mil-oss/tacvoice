use serde::{Deserialize, Serialize};

/// Metadata logged when a transmission is recorded.
/// Carries the operator callsign and transcript byte size.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct RecordingMeta {
    pub callsign: String,
    pub size: usize,
}
