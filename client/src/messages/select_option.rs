use serde::{Deserialize, Serialize};

/// A selectable enumeration option (brevity code plus human label).
/// `number` is the code, `value` is the displayed label.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SelectOption {
    pub number: String,
    pub value: String,
    #[serde(default)]
    pub default: bool,
}
