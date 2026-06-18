use serde::{Deserialize, Serialize};

/// A sub-detail beneath a line (e.g. KIA / WIA breakdown).
/// `number` is the detail index, `info` the label.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Detail {
    pub number: String,
    pub info: String,
}
