use crate::messages::message::Message;
use serde::{Deserialize, Serialize};

/// A color-coded category of tactical messages.
/// `kind` mirrors the XML `type` (OPERATIONS, INTELLIGENCE, ...).
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MessageGroup {
    pub kind: String,
    pub color: String,
    pub hex: String,
    pub messages: Vec<Message>,
}
