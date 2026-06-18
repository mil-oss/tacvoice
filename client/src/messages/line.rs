use crate::messages::line_kind::LineKind;
use serde::{Deserialize, Serialize};

/// A single report line with its identifier and label.
/// `id` is the line number or letter; `kind` is its content.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Line {
    pub id: String,
    pub info: String,
    pub kind: LineKind,
}
