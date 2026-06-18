use crate::messages::select_option::SelectOption;
use serde::{Deserialize, Serialize};

/// A named unit-of-measure dimension with its selectable codes.
/// Example: "Length" with Meters / Yards / Feet options.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Dimension {
    pub name: String,
    pub options: Vec<SelectOption>,
}
