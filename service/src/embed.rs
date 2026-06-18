//! Asset embedding for single-executable deployment.
use rust_embed::RustEmbed;
use std::io;
use zt_services::mtls_service::init_identity;

/// Embeds the full `assets/` tree for path-based lookups (e.g. `www/index.html`).
#[derive(RustEmbed)]
#[folder = "assets/"]
pub struct ServerAssets;

#[derive(RustEmbed)]
#[folder = "assets/keys/"]
struct Keys;

#[derive(RustEmbed)]
#[folder = "assets/xml/inst/tacvoice/"]
struct TacvoicePolicy;

#[derive(RustEmbed)]
#[folder = "assets/xml/inst/tacmsg/"]
struct Messages;

#[derive(RustEmbed)]
#[folder = "assets/voice/"]
struct VoiceAssets;

#[derive(RustEmbed)]
#[folder = "assets/www/"]
struct WebAssets;

/// Retrieves an embedded asset as bytes using a path relative to `assets/`.
pub fn get_asset(path: &str) -> Result<Vec<u8>, io::Error> {
    ServerAssets::get(path)
        .ok_or_else(|| {
            io::Error::new(
                io::ErrorKind::NotFound,
                format!("Asset not found: {}", path),
            )
        })
        .map(|f| f.data.to_vec())
}

/// Retrieves an embedded asset as UTF-8 text using a path relative to `assets/`.
pub fn get_asset_str(path: &str) -> Result<String, io::Error> {
    let bytes = get_asset(path)?;
    String::from_utf8(bytes)
        .map_err(|e| io::Error::new(io::ErrorKind::InvalidData, format!("Invalid UTF-8: {}", e)))
}

/// Returns the embedded tactical messages XML bytes.
pub fn get_messages_data() -> Result<Vec<u8>, io::Error> {
    Messages::get("messages.xml")
        .ok_or_else(|| {
            io::Error::new(
                io::ErrorKind::NotFound,
                "Asset not found: messages.xml",
            )
        })
        .map(|f| f.data.to_vec())
}

/// Returns the embedded tactical messages XML as UTF-8 text.
pub fn get_messages_str() -> Result<String, io::Error> {
    let bytes = get_messages_data()?;
    String::from_utf8(bytes)
        .map_err(|e| io::Error::new(io::ErrorKind::InvalidData, format!("Invalid UTF-8: {}", e)))
}

/// Returns the embedded TacVoice policy XML bytes.
pub fn get_tacvoice_policy_data() -> Result<Vec<u8>, io::Error> {
    TacvoicePolicy::get("tacvoice_policy.xml")
        .ok_or_else(|| {
            io::Error::new(
                io::ErrorKind::NotFound,
                "Asset not found: tacvoice_policy.xml",
            )
        })
        .map(|f| f.data.to_vec())
}

/// Returns an embedded `www/` asset by relative path (e.g. `index.html`).
pub fn get_web_asset(path: &str) -> Result<Vec<u8>, io::Error> {
    WebAssets::get(path)
        .ok_or_else(|| {
            io::Error::new(
                io::ErrorKind::NotFound,
                format!("Asset not found: {}", path),
            )
        })
        .map(|f| f.data.to_vec())
}

/// Lists all embedded `www/` asset paths.
pub fn iter_web_assets() -> impl Iterator<Item = std::borrow::Cow<'static, str>> {
    WebAssets::iter()
}

/// Returns the embedded UBM model bytes.
pub fn get_ubm() -> Result<Vec<u8>, io::Error> {
    VoiceAssets::get("ubm.bin")
        .ok_or_else(|| {
            io::Error::new(io::ErrorKind::NotFound, "Asset not found: ubm.bin")
        })
        .map(|f| f.data.to_vec())
}

/// Returns the embedded Vosk model archive bytes.
pub fn get_vosk() -> Result<Vec<u8>, io::Error> {
    VoiceAssets::get("vosk-model.tar.gz")
        .ok_or_else(|| {
            io::Error::new(
                io::ErrorKind::NotFound,
                "Asset not found: vosk-model.tar.gz",
            )
        })
        .map(|f| f.data.to_vec())
}

/// Returns the embedded TLS certificate chain.
pub fn get_cert_file() -> Result<Vec<u8>, io::Error> {
    Keys::get("public-chain.crt")
        .ok_or_else(|| {
            io::Error::new(
                io::ErrorKind::NotFound,
                "Asset not found: public-chain.crt",
            )
        })
        .map(|f| f.data.to_vec())
}

/// Returns the embedded TLS private key.
pub fn get_key_file() -> Result<Vec<u8>, io::Error> {
    Keys::get("private.key")
        .ok_or_else(|| {
            io::Error::new(
                io::ErrorKind::NotFound,
                "Asset not found: private.key",
            )
        })
        .map(|f| f.data.to_vec())
}

/// Initializes the process-wide FIPS mTLS identity from embedded cert chain and key.
pub fn init_mtls_identity() -> Result<(), Box<dyn std::error::Error>> {
    let cert = get_cert_file()?;
    let key = get_key_file()?;
    let _ = init_identity(cert, key);
    Ok(())
}
