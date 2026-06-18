//! Embedded voice repository assets for the voicerepo binary.
use rust_embed::RustEmbed;
use std::io;

#[derive(RustEmbed)]
#[folder = "assets/voice/"]
pub struct VoiceRepoAssets;

/// Returns the embedded UBM model bytes.
pub fn ubm_bin() -> Result<Vec<u8>, io::Error> {
    VoiceRepoAssets::get("ubm.bin")
        .ok_or_else(|| {
            io::Error::new(io::ErrorKind::NotFound, "embedded asset not found: ubm.bin")
        })
        .map(|f| f.data.to_vec())
}

/// Returns the embedded Vosk model archive bytes.
pub fn vosk_model() -> Result<Vec<u8>, io::Error> {
    VoiceRepoAssets::get("vosk-model.tar.gz")
        .ok_or_else(|| {
            io::Error::new(
                io::ErrorKind::NotFound,
                "embedded asset not found: vosk-model.tar.gz",
            )
        })
        .map(|f| f.data.to_vec())
}
