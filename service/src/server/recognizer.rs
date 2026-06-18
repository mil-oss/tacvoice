//! Recognizer service: receives recognition payloads and publishes results to Orderwire.
//! Thin coordination service; heavy GMM scoring stays out of scope here.

use crate::config::RECOGNITION_PATH;
use crate::server::structures::{RecognizerClient, RecognizerServer};
use futures::prelude::*;
use std::error::Error;
use std::future::Future;
use std::sync::OnceLock;
use tarpc::context::Context;
use tarpc::server::{BaseChannel, Channel};
use tarpc::tokio_util::codec::length_delimited::LengthDelimitedCodec;
use tokio::net::TcpListener;
use tokio_util::codec::Framed;
use zt_services::mtls_service::{self, RpcCache};
use zt_services::network_service::{self, interface_key};
use zt_services::orderwire_service::OrderwireMessage;
use zt_services::structures::{MtlsInterface, OrderwireClient};
use ztlb::message::RmpFormat;
use ztlb::time_id::base62_id;

fn recognizer_rpc_cache() -> &'static RpcCache<RecognizerServiceClient> {
    static CACHE: OnceLock<RpcCache<RecognizerServiceClient>> = OnceLock::new();
    CACHE.get_or_init(RpcCache::new)
}

impl RecognizerServer {
    /// Creates a new RecognizerServer bound to the given interface and Orderwire client.
    pub fn new(
        name: String,
        server_interface: MtlsInterface,
        orderwire_client: OrderwireClient,
    ) -> Self {
        Self {
            name,
            server_interface,
            orderwire_client,
        }
    }

    /// Starts the mTLS interface and begins listening for recognizer requests.
    pub async fn start_interface(&mut self) -> Result<(), Box<dyn Error>> {
        self.server_interface.start_interface().await?;
        self.listen().await?;
        Ok(())
    }

    /// Stops the mTLS interface and halts the recognizer service.
    pub async fn stop_interface(&self) -> Result<(), Box<dyn Error>> {
        self.server_interface.stop_interface().await?;
        Ok(())
    }

    /// Listens for incoming TCP connections and serves recognizer RPC requests.
    pub async fn listen(&self) -> Result<(), Box<dyn Error>> {
        let listener = TcpListener::bind(format!(
            "{}:{}",
            self.server_interface.address.0, self.server_interface.address.1
        ))
        .await?;
        let allowed = self.server_interface.allowed_addr.clone();
        loop {
            let tcp = match network_service::accept_allowed(&listener, &allowed).await {
                Ok((tcp, _)) => tcp,
                Err(e) => {
                    eprintln!("{}", e);
                    continue;
                }
            };
            let server_instance = self.clone();
            tokio::spawn(async move {
                let tcp = match mtls_service::wrap_server(tcp).await {
                    Ok(s) => s,
                    Err(e) => {
                        eprintln!("mTLS accept error: {}", e);
                        return;
                    }
                };
                let length_delimited = Framed::new(tcp, LengthDelimitedCodec::new());
                let transport = tarpc::serde_transport::new(length_delimited, RmpFormat);
                BaseChannel::with_defaults(transport)
                    .execute(server_instance.serve())
                    .for_each(spawn)
                    .await;
            });
        }
    }
}

/// Recognizer service RPC interface for publishing recognition results.
#[tarpc::service]
pub trait RecognizerService {
    /// Health check endpoint.
    async fn ping() -> Result<String, String>;
    /// Publishes a serialized recognition result to Orderwire; returns the Orderwire path.
    async fn publish_recognition(content: Vec<u8>) -> Result<String, String>;
}

impl RecognizerService for RecognizerServer {
    /// Handles ping requests, returning a success message.
    async fn ping(self, _: Context) -> Result<String, String> {
        Ok("ok".to_owned())
    }
    /// Publishes a recognition payload to Orderwire and returns its path.
    async fn publish_recognition(
        self,
        _: Context,
        content: Vec<u8>,
    ) -> Result<String, String> {
        let path = format!("{}/{}", RECOGNITION_PATH, base62_id());
        self.orderwire_client
            .send(path.clone(), OrderwireMessage::BinaryFile(content))
            .await?;
        Ok(path)
    }
}

/// Spawns a new asynchronous task.
async fn spawn(fut: impl Future<Output = ()> + Send + 'static) {
    tokio::spawn(fut);
}

impl RecognizerClient {
    /// Creates a new RecognizerClient with the given name and network interface.
    pub fn new(name: String, client_interface: MtlsInterface) -> Self {
        Self {
            name,
            client_interface,
        }
    }

    /// Establishes a cached RPC connection to the RecognizerServer.
    async fn recognizer_service_client(
        &self,
    ) -> Result<RecognizerServiceClient, Box<dyn std::error::Error + Send + Sync>> {
        let iface = self.client_interface.clone();
        let cache_key = interface_key(&iface);
        recognizer_rpc_cache()
            .get_or_connect(&cache_key, || async {
                let tcp = iface.connect_tcp().await?;
                let tcp = mtls_service::wrap_client(tcp)
                    .await
                    .map_err(|e| format!("mTLS client handshake failed: {}", e))?;
                let length_delimited = Framed::new(tcp, LengthDelimitedCodec::new());
                let transport = tarpc::serde_transport::new(length_delimited, RmpFormat);
                Ok(RecognizerServiceClient::new(Default::default(), transport).spawn())
            })
            .await
            .map_err(|e: String| -> Box<dyn std::error::Error + Send + Sync> { e.into() })
    }

    /// Health check to verify recognizer service connectivity.
    pub async fn ping(&self) -> Result<String, String> {
        let client = self
            .recognizer_service_client()
            .await
            .map_err(|e| format!("Failed to connect to recognizer service: {}", e))?;
        client
            .ping(tarpc::context::current())
            .await
            .map_err(|e| e.to_string())?
    }

    /// Publishes a serialized recognition result and returns the Orderwire path.
    pub async fn publish_recognition(&self, content: Vec<u8>) -> Result<String, String> {
        let client = self
            .recognizer_service_client()
            .await
            .map_err(|e| format!("Failed to connect to recognizer service: {}", e))?;
        client
            .publish_recognition(tarpc::context::current(), content)
            .await
            .map_err(|e| e.to_string())?
    }
}
