pub mod config;
pub mod gateway;
pub mod grpc;
pub mod service_gateways;

pub use gateway::{build_tacvoice_grpc_router, run_tacvoice_gate_with_config};
pub use service_gateways::recognizer_gateway::RecognizerClientOps;
pub use service_gateways::tacvoice_gateway::TacVoiceClientOps;
pub use service_gateways::transcriber_gateway::TranscriberClientOps;
