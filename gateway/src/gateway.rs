use crate::config::GATEWAY_SERVICE;
use crate::grpc::recognizer_service::recognizer_service_server::RecognizerServiceServer;
use crate::grpc::tacvoice_service::tacvoice_service_server::TacvoiceServiceServer;
use crate::grpc::transcriber_service::transcriber_service_server::TranscriberServiceServer;
use crate::service_gateways::recognizer_gateway::{RecognizerClientOps, RecognizerGateway};
use crate::service_gateways::tacvoice_gateway::{TacVoiceClientOps, TacVoiceGateway};
use crate::service_gateways::transcriber_gateway::{TranscriberClientOps, TranscriberGateway};
use axum::Router;
use services::structures::ServiceCfgType;
use std::collections::HashMap;
use std::error::Error;
use std::net::SocketAddr;
use tonic::service::Routes;
use tonic_web::GrpcWebLayer;
use tower_http::cors::{Any, CorsLayer};

/// Resolves gateway address from cfg_map and runs the TacVoice gRPC-Web gateway.
pub async fn run_tacvoice_gate_with_config(
    cfg_map: HashMap<String, ServiceCfgType>,
    client: Box<dyn TacVoiceClientOps>,
    transcriber_client: Box<dyn TranscriberClientOps>,
    recognizer_client: Box<dyn RecognizerClientOps>,
) -> Result<(), Box<dyn Error>> {
    println!("Starting TacVoice Gateway with provided configuration...");
    let gateway_cfg = cfg_map.get(GATEWAY_SERVICE).ok_or_else(|| {
        format!(
            "Gateway service configuration not found in policy. Looking for: {}. Available services: {:?}",
            GATEWAY_SERVICE,
            cfg_map.keys().collect::<Vec<_>>()
        )
    })?;
    let gateway_ip = gateway_cfg
        .ip_address_text
        .clone()
        .ok_or_else(|| "Gateway IP not configured".to_string())?;
    let gateway_port = gateway_cfg
        .service_port_numeric
        .ok_or_else(|| "Gateway port not configured".to_string())?;
    println!(
        "Gateway configuration from policy: IP={}, Port={}",
        gateway_ip, gateway_port
    );
    let gateway_addr: SocketAddr = format!("{}:{}", gateway_ip, gateway_port)
        .parse()
        .map_err(|e| format!("Failed to parse gateway address: {}", e))?;

    run_tacvoice_gate(client, transcriber_client, recognizer_client, gateway_addr).await?;
    println!("TacVoice Gateway stopped");
    Ok(())
}

/// Builds the TacVoice gRPC-Web axum router for embedding in the HTTPS server.
pub fn build_tacvoice_grpc_router(
    client: Box<dyn TacVoiceClientOps>,
    transcriber_client: Box<dyn TranscriberClientOps>,
    recognizer_client: Box<dyn RecognizerClientOps>,
) -> Router {
    let tacvoice_gateway = TacVoiceGateway::new(client);
    let transcriber_gateway = TranscriberGateway::new(transcriber_client);
    let recognizer_gateway = RecognizerGateway::new(recognizer_client);
    let cors = CorsLayer::new()
        .allow_origin(Any)
        .allow_methods(Any)
        .allow_headers(Any)
        .expose_headers(Any);
    let grpc_routes = Routes::default()
        .add_service(TacvoiceServiceServer::new(tacvoice_gateway))
        .add_service(TranscriberServiceServer::new(transcriber_gateway))
        .add_service(RecognizerServiceServer::new(recognizer_gateway));
    grpc_routes
        .prepare()
        .into_axum_router()
        .layer(GrpcWebLayer::new())
        .layer(cors)
}

/// Serves TacVoiceService over gRPC-Web on the configured address.
pub async fn run_tacvoice_gate(
    client: Box<dyn TacVoiceClientOps>,
    transcriber_client: Box<dyn TranscriberClientOps>,
    recognizer_client: Box<dyn RecognizerClientOps>,
    addr: SocketAddr,
) -> Result<(), Box<dyn Error>> {
    println!("TacVoice gRPC-Web gateway listening on {}", addr);
    let app = build_tacvoice_grpc_router(client, transcriber_client, recognizer_client);

    let listener = tokio::net::TcpListener::bind(addr)
        .await
        .map_err(|e| format!("Failed to bind gateway listener on {}: {}", addr, e))?;
    axum::serve(listener, app)
        .await
        .map_err(|e| format!("Gateway HTTP server error on {}: {}", addr, e))?;

    Ok(())
}
