//! gRPC-Web gateway client: message catalog served in-process, logging via tarpc.
use crate::server::messages;
use crate::server::structures::{RecognizerClient, TacVoiceClient, TranscriberClient};
use zt_gateway::service_gateways::recognizer_gateway::RecognizerClientOps;
use zt_gateway::service_gateways::tacvoice_gateway::TacVoiceClientOps;
use zt_gateway::service_gateways::transcriber_gateway::TranscriberClientOps;

/// Serves tactical messages from the embedded catalog and delegates ledger RPCs remotely.
pub struct TacVoiceGatewayClient {
    remote: TacVoiceClient,
}

impl TacVoiceGatewayClient {
    /// Wraps a tarpc client used for logging actions.
    pub fn new(remote: TacVoiceClient) -> Self {
        Self { remote }
    }
}

#[async_trait::async_trait]
impl TacVoiceClientOps for TacVoiceGatewayClient {
    async fn log_startup(&self) -> std::result::Result<String, String> {
        self.remote.log_startup().await
    }

    async fn log_recording(&self, metadata: Vec<u8>) -> std::result::Result<String, String> {
        self.remote.log_recording(metadata).await
    }

    async fn log_submission(&self, metadata: Vec<u8>) -> std::result::Result<String, String> {
        self.remote.log_submission(metadata).await
    }

    async fn log_shutdown(&self) -> std::result::Result<String, String> {
        self.remote.log_shutdown().await
    }

    async fn get_message_form(&self, number: String) -> std::result::Result<Vec<u8>, String> {
        match messages::catalog().get_message_form(&number) {
            Some(msg) => serde_json::to_vec(msg)
                .map_err(|e| format!("Failed to serialize message '{}': {}", number, e)),
            None => Err(format!("Message '{}' not found", number)),
        }
    }

    async fn get_catalog(&self) -> std::result::Result<Vec<u8>, String> {
        serde_json::to_vec(&messages::catalog().groups)
            .map_err(|e| format!("Failed to serialize catalog: {}", e))
    }
}

/// Bridges browser gRPC-Web calls to the Transcriber tarpc client.
pub struct TranscriberGatewayClient {
    remote: TranscriberClient,
}

impl TranscriberGatewayClient {
    /// Wraps a Transcriber tarpc client for the gateway.
    pub fn new(remote: TranscriberClient) -> Self {
        Self { remote }
    }
}

#[async_trait::async_trait]
impl TranscriberClientOps for TranscriberGatewayClient {
    async fn publish_transcription(&self, content: Vec<u8>) -> std::result::Result<String, String> {
        self.remote.publish_transcription(content).await
    }
}

/// Bridges browser gRPC-Web calls to the Recognizer tarpc client.
pub struct RecognizerGatewayClient {
    remote: RecognizerClient,
}

impl RecognizerGatewayClient {
    /// Wraps a Recognizer tarpc client for the gateway.
    pub fn new(remote: RecognizerClient) -> Self {
        Self { remote }
    }
}

#[async_trait::async_trait]
impl RecognizerClientOps for RecognizerGatewayClient {
    async fn publish_recognition(&self, content: Vec<u8>) -> std::result::Result<String, String> {
        self.remote.publish_recognition(content).await
    }
}
