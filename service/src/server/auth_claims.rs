use serde::{Deserialize, Serialize};

/// Validated OIDC claims extracted from a Keycloak access token.
/// Carries the subject, username, and realm/client group memberships.
#[derive(Debug, Clone, Serialize, Deserialize, Default)]
#[serde(default)]
pub struct TacClaims {
    pub sub: String,
    pub preferred_username: String,
    pub groups: Vec<String>,
    pub iss: String,
    pub exp: u64,
}

/// Identity resolved from validated claims and mapped onto a policy Entity.
/// Attached to each authenticated request for downstream access control.
#[derive(Debug, Clone, Serialize, Deserialize, Default)]
pub struct AuthContext {
    pub subject: String,
    pub username: String,
    pub entity: Option<String>,
    pub groups: Vec<String>,
}
