use crate::messages::line::Line;
use serde::{Deserialize, Serialize};

/// A tactical message form definition.
/// Holds identifying metadata, ordered lines, and an optional remarks field.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Message {
    #[serde(default)]
    pub number: String,
    pub name: String,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub alert: Option<String>,
    pub lines: Vec<Line>,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub remarks: Option<String>,
}
