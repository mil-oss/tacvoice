pub use crate::embed;
pub mod auth_claims;
pub mod error;
pub mod gateway_client;
pub mod messages;
pub mod recognition;
pub mod structures;
pub mod tacvoice;
pub mod transcription;

#[cfg(not(target_arch = "wasm32"))]
pub mod auth;
#[cfg(not(target_arch = "wasm32"))]
pub mod recognizer;
#[cfg(not(target_arch = "wasm32"))]
pub mod transcriber;
