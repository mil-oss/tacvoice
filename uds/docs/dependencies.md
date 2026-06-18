# Dependencies

## Platform

| Dependency | Version (dev) | Why |
| --- | --- | --- |
| UDS Core (k3d-core-demo) | `1.6.0` | Default platform: Istio, Keycloak, Pepr, Grafana, Loki, Prometheus. |
| UDS Core (slim-dev) | `1.6.0` | Optional lightweight stack (no observability); set `UDS_CORE_BUNDLE`. |
| Zarf init | `v0.77.0` | In-cluster registry + agent. |
| uds-k3d | `0.20.1-airgap` | Local k3d cluster + dev registry (local only). |
| UDS CLI | latest | `uds run`, `uds zarf`, bundle deploy. |
| Docker Engine | latest | Container runtime for k3d and OCI image builds. |

The three UDS refs (`uds-k3d-dev`, `init`, `core-slim-dev`) in `uds-bundle.yaml`
apply to the custom TacVoice dev bundle only. Platform install via
`install_uds_core.sh` defaults to `k3d-core-demo:1.6.0`.

## Observability consumed

- **Grafana** (`grafana` namespace): metrics and log exploration; admin gateway
  `https://grafana.admin.uds.dev`; SSO via Keycloak (`/UDS Core/Admin` or Auditor).
- **Prometheus** (`monitoring` namespace): scrapes kube, Istio, and Blackbox probes.
- **Loki** (`logging` namespace): stores container stdout/stderr from all pods.
- **Vector** (`vector` namespace): ships node and container logs to Loki.

See [observability.md](observability.md) for access helpers and sample queries.

## Runtime services consumed

- **Keycloak** (`keycloak` namespace): JWKS endpoint for native token validation.
  The only egress the app makes (port 8080). DNS is auto-allowed by the operator.
- **Istio tenant gateway** (`istio-tenant-gateway`): north-south ingress; the
  `Package` CR `expose` rule provisions the VirtualService and gateway ingress.

## Build inputs

The image is built from the parent directory containing both `tacvoice/` and
`ztlb/` (the service crate depends on `../../ztlb`). The WASM UI bundle under
`service/assets/www/js/pkg` must be pre-built (rust-embed bakes it at compile time).
See `Containerfile`, `service/scripts/build_uds_package.sh`, and `uds/tasks.yaml` (`build-image`, `create`).
