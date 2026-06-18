use crate::server::structures::ErrorResponse;
use crate::voice::structures::*;
use axum::extract::{Json, State};
use std::time::SystemTime;

/// Health check handler
pub async fn health_check() -> Json<HealthResponse> {
    Json(HealthResponse {
        status: "healthy".to_string(),
        version: env!("CARGO_PKG_VERSION").to_string(),
        timestamp: SystemTime::now()
            .duration_since(SystemTime::UNIX_EPOCH)
            .unwrap()
            .as_secs(),
    })
}

/// Enroll voice-print
pub async fn enroll(
    State(_state): State<AppState>,
    Json(_req): Json<VoiceprintRequest>,
) -> Result<Json<SuccessResponse<VoiceprintResponse>>, ErrorResponse> {
    // TODO: Implement full voiceprint logic
    // 1. Decode voice-print from base64
    // 2. Verify payment or collect payment
    // 3. Execute blockchain transaction
    // 4. Return response

    Err(ErrorResponse {
        error: "Voiceprint endpoint not yet implemented".to_string(),
        code: "NOT_IMPLEMENTED".to_string(),
    })
}

/// Verify voice-print
pub async fn verify(
    State(_state): State<AppState>,
    Json(_req): Json<VerificationRequest>,
) -> Result<Json<SuccessResponse<VerificationResponse>>, ErrorResponse> {
    // TODO: Implement full verification logic

    Err(ErrorResponse {
        error: "Verification endpoint not yet implemented".to_string(),
        code: "NOT_IMPLEMENTED".to_string(),
    })
}
