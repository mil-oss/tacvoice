# Configuration

All deployment-time configuration lives in the config chart's `values.yaml`
(`uds/chart/values.yaml`). Override with Helm/Zarf values or a UDS bundle override.

## Chart values

| Value | Default | Description |
| --- | --- | --- |
| `namespace` | `tacvoice` | Target namespace (created by Zarf, labeled ambient by the operator). |
| `nameOverride` | `tacvoice` | Workload, Service, and `Package` CR name. |
| `replicaCount` | `1` | Deployment replicas. |
| `domain` | `uds.dev` | Tenant domain; SSO redirect/origin become `tacvoice.<domain>`. |
| `image.repository` | `localhost:5000/tacvoice` | Image repo. |
| `image.tag` | `latest` | Image tag. |
| `image.pullPolicy` | `IfNotPresent` | Pull policy. |
| `web.containerPort` | `4443` | Plain-HTTP edge port inside the web container. |
| `web.servicePort` | `8080` | Service port exposed through the gateway. |
| `ledgerHome` | `/home/ztxs` | `$HOME` + LMDB ledger root (writable emptyDir subPath). |
| `podSecurityContext` | non-root 65532 | Pod-level securityContext (runAsNonRoot, fsGroup). |
| `securityContext` | drop ALL caps | Container-level securityContext. |
| `keyService` | `tvks` :31010 | Init container (KeyService). |
| `services` | 8 entries | Ordered ZT/service containers (name/command/port). |
| `sso.name` | `TacVoice Login` | Keycloak client display name. |
| `sso.clientId` | `uds-tac-tacvoice` | Keycloak clientId (convention `uds-<group>-<app>`). |

## OIDC environment

The web container reads these env vars (constants in `service/src/config.rs`):

| Env | Value source | Purpose |
| --- | --- | --- |
| `TACVOICE_EDGE_PLAINTEXT` | `oidc.edgePlaintext` (`1`) | Serve plain HTTP at the edge (Istio does TLS). |
| `OIDC_ENFORCE` | `oidc.enforce` (`1`) | Require a valid bearer token. |
| `OIDC_ISSUER` | `oidc.issuer` | Expected token `iss` (external Keycloak realm URL). |
| `OIDC_JWKS_URI` | `oidc.jwksUri` | In-cluster JWKS endpoint for signature validation. |
| `OIDC_AUDIENCE` | `oidc.audience` | Expected `aud`; set to the SSO `clientId`. |

The browser loads PKCE settings from `GET /.well-known/tacvoice/oidc.json`
(`enforce`, `issuer`, `clientId`) and redirects to Keycloak when enforcement is on.

`oidc.audience` MUST equal `sso.clientId` (`uds-tac-tacvoice`). The app does not
hard-fail on `aud` today (`validate_aud=false` in `service/src/server/auth.rs`), so
this is a config-only alignment.

## Domain override example

```yaml
# uds-config.yaml (or bundle override)
overrides:
  tacvoice:
    uds-tacvoice-config:
      values:
        - path: domain
          value: example.dev
```
