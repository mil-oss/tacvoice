use serde::{Deserialize, Serialize};

/// Metadata logged when a completed form is submitted.
/// Carries the message identity and serialized radio/chat payloads.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SubmissionMeta {
    pub message_name: String,
    pub message_number: String,
    pub radio: String,
    pub chat: String,
}
