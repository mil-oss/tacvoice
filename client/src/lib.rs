//! TacVoice client library.
//! Shared tactical message model and browser WASM form rendering.

pub mod logmeta;
pub mod messages;
pub mod transcript_parse;

#[cfg(target_arch = "wasm32")]
pub mod wasm;
