//! Embedded message repository assets for the msgrepo binary.
use rust_embed::RustEmbed;
use std::io;

#[derive(RustEmbed)]
#[folder = "assets/xml/inst/tacmsg/"]
pub struct MessageRepoAssets;

/// Returns the embedded tactical messages XML bytes.
pub fn messages_xml() -> Result<Vec<u8>, io::Error> {
    MessageRepoAssets::get("messages.xml")
        .ok_or_else(|| {
            io::Error::new(
                io::ErrorKind::NotFound,
                "embedded asset not found: messages.xml",
            )
        })
        .map(|f| f.data.to_vec())
}
