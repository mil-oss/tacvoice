use crate::grpc::transcriber;
use crate::grpc::transcriber_service::transcriber_service_server::TranscriberService;
use tonic::{Request, Response, Status};

/// Trait for Transcriber client operations invoked from the gRPC-Web gateway.
#[async_trait::async_trait]
pub trait TranscriberClientOps: Send + Sync {
    async fn publish_transcription(&self, content: Vec<u8>) -> std::result::Result<String, String>;
}

/// gRPC-Web gateway delegating to a Transcriber tarpc client.
pub struct TranscriberGateway {
    client: Box<dyn TranscriberClientOps>,
}

impl TranscriberGateway {
    /// Creates a gateway backed by the given Transcriber client trait object.
    pub fn new(client: Box<dyn TranscriberClientOps>) -> Self {
        Self { client }
    }
}

#[tonic::async_trait]
impl TranscriberService for TranscriberGateway {
    async fn publish_transcription(
        &self,
        request: Request<transcriber::PublishTranscriptionRequest>,
    ) -> Result<Response<transcriber::PublishTranscriptionResponse>, Status> {
        let req = request.into_inner();
        let path = self
            .client
            .publish_transcription(req.transcription)
            .await
            .map_err(|e| Status::internal(format!("publish_transcription failed: {}", e)))?;
        Ok(Response::new(transcriber::PublishTranscriptionResponse {
            path,
        }))
    }
}
