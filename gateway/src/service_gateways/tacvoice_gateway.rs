use crate::grpc::tacvoice;
use crate::grpc::tacvoice::action::Kind;
use crate::grpc::tacvoice_service::tacvoice_service_server::TacvoiceService;
use tonic::{Request, Response, Status};

/// Debug flag for conditional printing.
const DBG: bool = true;

/// Prints a debug message if the `DBG` constant is true.
fn dbg_println(msg: String) {
    if DBG {
        println!("[tacvoice_gateway]{}", msg);
    }
}

/// Trait for TacVoice client operations invoked from the gRPC-Web gateway.
#[async_trait::async_trait]
pub trait TacVoiceClientOps: Send + Sync {
    async fn log_startup(&self) -> std::result::Result<String, String>;
    async fn log_recording(&self, metadata: Vec<u8>) -> std::result::Result<String, String>;
    async fn log_submission(&self, metadata: Vec<u8>) -> std::result::Result<String, String>;
    async fn log_shutdown(&self) -> std::result::Result<String, String>;
    async fn get_message_form(&self, number: String) -> std::result::Result<Vec<u8>, String>;
    async fn get_catalog(&self) -> std::result::Result<Vec<u8>, String>;
}

/// gRPC-Web gateway delegating to a TacVoice tarpc client.
pub struct TacVoiceGateway {
    client: Box<dyn TacVoiceClientOps>,
}

impl TacVoiceGateway {
    /// Creates a gateway backed by the given TacVoice client trait object.
    pub fn new(client: Box<dyn TacVoiceClientOps>) -> Self {
        dbg_println("Creating new TacVoiceGateway instance".to_string());
        Self { client }
    }
}

#[tonic::async_trait]
impl TacvoiceService for TacVoiceGateway {
    async fn log_action(
        &self,
        request: Request<tacvoice::Action>,
    ) -> Result<Response<tacvoice::LogResponse>, Status> {
        let action = request.into_inner();
        let kind = action
            .kind
            .ok_or_else(|| Status::invalid_argument("action kind is required"))?;

        let message = match kind {
            Kind::StartService(_) => self
                .client
                .log_startup()
                .await
                .map_err(|e| Status::internal(format!("start_service failed: {}", e)))?,
            Kind::RecordMessage(record_message) => self
                .client
                .log_recording(record_message.metadata.clone())
                .await
                .map_err(|e| Status::internal(format!("record_message failed: {}", e)))?,
            Kind::SubmitMessage(submit_message) => {
                dbg_println(format!(
                    " submit_message metadata={}",
                    String::from_utf8_lossy(&submit_message.metadata)
                ));
                return Ok(Response::new(tacvoice::LogResponse {
                    message: "Submission received".to_string(),
                }));
            }
            Kind::StopService(_) => self
                .client
                .log_shutdown()
                .await
                .map_err(|e| Status::internal(format!("stop_service failed: {}", e)))?,
        };

        Ok(Response::new(tacvoice::LogResponse { message }))
    }

    async fn get_message_form(
        &self,
        request: Request<tacvoice::GetMessageRequest>,
    ) -> Result<Response<tacvoice::GetMessageResponse>, Status> {
        let number = request.into_inner().number;
        dbg_println(format!(" get_message request for '{}'", number));
        let message = self
            .client
            .get_message_form(number)
            .await
            .map_err(|e| Status::internal(format!("get_message failed: {}", e)))?;
        Ok(Response::new(tacvoice::GetMessageResponse { message }))
    }

    async fn get_catalog(
        &self,
        _request: Request<tacvoice::GetCatalogRequest>,
    ) -> Result<Response<tacvoice::GetCatalogResponse>, Status> {
        let catalog = self
            .client
            .get_catalog()
            .await
            .map_err(|e| Status::internal(format!("get_catalog failed: {}", e)))?;
        dbg_println(format!(" get_catalog returning {} bytes", catalog.len()));
        Ok(Response::new(tacvoice::GetCatalogResponse { catalog }))
    }
}
