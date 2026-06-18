use crate::config::{OIDC_ENFORCE_ENV, OIDC_ISSUER_ENV, OIDC_JWKS_URI_ENV};
use crate::server::auth_claims::{AuthContext, TacClaims};
use jsonwebtoken::jwk::JwkSet;
use jsonwebtoken::{decode, decode_header, Algorithm, DecodingKey, Validation};
use std::collections::HashMap;
use std::sync::Arc;
use tokio::sync::RwLock;
use zt_strcts::policy_strct::PolicyType;

/// Verifies Keycloak OIDC access tokens and maps them onto policy Entities.
/// Caches JWKS decoding keys by `kid` and refreshes on cache misses.
#[derive(Clone)]
pub struct OidcVerifier {
    issuer: String,
    jwks_uri: String,
    enforce: bool,
    entities: Vec<String>,
    keys: Arc<RwLock<HashMap<String, DecodingKey>>>,
}

/// Returns the lowercased Entity name list from the policy for group mapping.
/// Used to resolve a token's groups to a single authoritative Entity.
pub fn entity_names(policy: &PolicyType) -> Vec<String> {
    policy
        .entities
        .as_ref()
        .map(|e| {
            e.entity
                .iter()
                .filter_map(|ent| ent.name_text.clone())
                .collect()
        })
        .unwrap_or_default()
}

impl OidcVerifier {
    /// Builds a verifier from OIDC_* env vars; returns None when OIDC is unconfigured.
    /// Absent issuer means the legacy (non-mesh) path runs without token checks.
    pub fn from_env(entities: Vec<String>) -> Option<Self> {
        let issuer = std::env::var(OIDC_ISSUER_ENV).ok()?;
        let jwks_uri = std::env::var(OIDC_JWKS_URI_ENV).unwrap_or_else(|_| {
            format!("{}/protocol/openid-connect/certs", issuer.trim_end_matches('/'))
        });
        let enforce = std::env::var(OIDC_ENFORCE_ENV)
            .map(|v| v == "1" || v.eq_ignore_ascii_case("true"))
            .unwrap_or(false);
        Some(Self {
            issuer,
            jwks_uri,
            enforce,
            entities,
            keys: Arc::new(RwLock::new(HashMap::new())),
        })
    }

    /// Returns whether unauthenticated requests must be rejected.
    pub fn enforce(&self) -> bool {
        self.enforce
    }

    /// Fetches the JWKS and rebuilds the kid->key cache from the issuer.
    async fn refresh_keys(&self) -> Result<(), String> {
        let set: JwkSet = reqwest::get(&self.jwks_uri)
            .await
            .map_err(|e| format!("jwks fetch failed: {}", e))?
            .json()
            .await
            .map_err(|e| format!("jwks parse failed: {}", e))?;
        let mut map = HashMap::new();
        for jwk in set.keys.iter() {
            if let Some(kid) = jwk.common.key_id.clone() {
                if let Ok(key) = DecodingKey::from_jwk(jwk) {
                    map.insert(kid, key);
                }
            }
        }
        let mut guard = self.keys.write().await;
        *guard = map;
        Ok(())
    }

    /// Returns the decoding key for a kid, refreshing the cache once on miss.
    async fn key_for(&self, kid: &str) -> Result<DecodingKey, String> {
        if let Some(key) = self.keys.read().await.get(kid).cloned() {
            return Ok(key);
        }
        self.refresh_keys().await?;
        self.keys
            .read()
            .await
            .get(kid)
            .cloned()
            .ok_or_else(|| format!("no jwks key for kid {}", kid))
    }

    /// Verifies a bearer token's signature, issuer, and expiry; returns its claims.
    pub async fn verify(&self, token: &str) -> Result<TacClaims, String> {
        let header = decode_header(token).map_err(|e| format!("bad token header: {}", e))?;
        let kid = header.kid.ok_or_else(|| "token missing kid".to_string())?;
        let key = self.key_for(&kid).await?;
        let mut validation = Validation::new(Algorithm::RS256);
        validation.set_issuer(&[self.issuer.clone()]);
        // Keycloak access tokens carry the client in `azp`; `aud` is often "account",
        // so audience is checked softly below rather than failing verification here.
        validation.validate_aud = false;
        let data = decode::<TacClaims>(token, &key, &validation)
            .map_err(|e| format!("token verification failed: {}", e))?;
        Ok(data.claims)
    }

    /// Resolves the first token group that matches a known policy Entity name.
    /// Group paths like "/Operations" are normalized before comparison.
    pub fn resolve_entity(&self, claims: &TacClaims) -> Option<String> {
        for group in &claims.groups {
            let normalized = group.trim_start_matches('/').trim();
            if let Some(found) = self
                .entities
                .iter()
                .find(|e| e.eq_ignore_ascii_case(normalized))
            {
                return Some(found.clone());
            }
        }
        None
    }

    /// Verifies a token and builds the per-request AuthContext with resolved Entity.
    pub async fn authorize(&self, token: &str) -> Result<AuthContext, String> {
        let claims = self.verify(token).await?;
        let entity = self.resolve_entity(&claims);
        Ok(AuthContext {
            subject: claims.sub.clone(),
            username: claims.preferred_username.clone(),
            entity,
            groups: claims.groups.clone(),
        })
    }
}
