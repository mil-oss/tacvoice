//! WASM export hub for TacVoice client setup helpers.

use wasm_bindgen::prelude::*;

/// Installs the panic hook that forwards Rust panics to the browser console.
#[wasm_bindgen]
pub fn init_panic_hook() {
    console_error_panic_hook::set_once();
}

/// Returns the TacVoice WASM module version string.
#[wasm_bindgen]
pub fn tacvoice_wasm_version() -> String {
    format!("TacVoice WASM v{}", env!("CARGO_PKG_VERSION"))
}
