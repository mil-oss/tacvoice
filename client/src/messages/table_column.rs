use serde::{Deserialize, Serialize};

/// A column header within a tabular line.
/// `col_type` mirrors the optional XML `type` attribute.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TableColumn {
    pub name: String,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub col_type: Option<String>,
}
