use crate::messages::table_column::TableColumn;
use serde::{Deserialize, Serialize};

/// A tabular line definition with header columns and optional fixed rows.
/// `row_count` requests N blank data rows when present.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TableDef {
    pub columns: Vec<TableColumn>,
    pub rows: Vec<String>,
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub row_count: Option<u32>,
}
