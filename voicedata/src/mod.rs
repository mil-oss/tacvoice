pub mod fuzzy;
pub mod gmm_config;
#[cfg(not(target_arch = "wasm32"))]
pub mod handlers;
#[cfg(not(target_arch = "wasm32"))]
pub mod pipeline;
pub mod structures;
pub mod voiceprint;

pub use structures::{GmmParameters, VoicePrint, VoiceprintMetadata};
