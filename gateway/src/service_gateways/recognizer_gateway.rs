use crate::grpc::recognizer;
use crate::grpc::recognizer_service::recognizer_service_server::RecognizerService;
use tonic::{Request, Response, Status};

/// Trait for Recognizer client operations invoked from the gRPC-Web gateway.
#[async_trait::async_trait]
pub trait RecognizerClientOps: Send + Sync {
    async fn publish_recognition(&self, content: Vec<u8>) -> std::result::Result<String, String>;
}

/// gRPC-Web gateway delegating to a Recognizer tarpc client.
pub struct RecognizerGateway {
    client: Box<dyn RecognizerClientOps>,
}

impl RecognizerGateway {
    /// Creates a gateway backed by the given Recognizer client trait object.
    pub fn new(client: Box<dyn RecognizerClientOps>) -> Self {
        Self { client }
    }
}

#[tonic::async_trait]
impl RecognizerService for RecognizerGateway {
    async fn publish_recognition(
        &self,
        request: Request<recognizer::PublishRecognitionRequest>,
    ) -> Result<Response<recognizer::PublishRecognitionResponse>, Status> {
        let req = request.into_inner();
        let path = self
            .client
            .publish_recognition(req.recognition)
            .await
            .map_err(|e| Status::internal(format!("publish_recognition failed: {}", e)))?;
        Ok(Response::new(recognizer::PublishRecognitionResponse { path }))
    }
}
