# TacVoice UDS Package

TacVoice is a tactical voice service that performs speech transcription and speaker
recognition. This package deploys TacVoice onto a UDS Core cluster as a single Pod
of ten cooperating Rust binaries, fronted by the Istio tenant gateway with native
OIDC (Keycloak) authentication.

## Architecture

```
Browser --HTTPS + OIDC--> Istio tenant gateway --ambient mTLS (ztunnel)--> tacvoice web (plain HTTP :4443)
                                                                              |
                                          FIPS mTLS over loopback (uncaptured) v
                                                              9 ZT/service containers (tvks init + 8)
tacvoice web --JWKS--> Keycloak
```

- The `tacvoice` web container is the only mesh-exposed surface. It serves plain
  HTTP on `:4443`; Istio terminates external TLS and enforces north-south mTLS.
- The other nine containers (`tvks` init + `tvps`, `tvfs`, `tvws`, `tvls`,
  `msgrepo`, `voicerepo`, `transcriber`, `recognizer`) communicate over the app's
  own FIPS mTLS on loopback, which the ambient data plane never captures.
- Authentication is native: the web edge validates Keycloak bearer tokens against
  the in-cluster JWKS endpoint and maps token `groups` to policy Entities.

## Contents

- `chart/` - UDS config Helm chart (workload, Service, `Package` CR, PeerAuthentication).
- `zarf.yaml` - Zarf package (image + chart + SBOM).
- `uds-bundle.yaml` - local dev bundle (k3d + UDS Core slim-dev + this package).
- `uds-bundle-app.yaml` / `bundle-app/` - app-only bundle for existing UDS Core clusters.
- `uds-config-app.yaml` - consumer cluster variable template.
- `tasks.yaml` - build/deploy/lint/test tasks (`uds run ...`).
- `docs/` - this documentation set.
- `tests/` - journey and upgrade smoke tests.

## Quick start

Prerequisites: Docker Engine running, `uds` CLI installed.

From the repo root:

```bash
./service/scripts/tacvoice_up.sh        # platform (if needed) + build + deploy TacVoice
uds run -f uds/tasks.yaml test        # post-deploy journey checks
./service/scripts/tacvoice_down.sh    # remove the TacVoice package
```

### Distributable package (no deploy)

```bash
./service/scripts/build_uds_package.sh  # outputs to uds_package/
```

See [doc/UDS_Package.md](../../doc/UDS_Package.md) for publish and remote-cluster consume instructions.

See [configuration.md](configuration.md) for tunable values,
[dependencies.md](dependencies.md) for platform requirements, and
[observability.md](observability.md) for Grafana/Loki/Prometheus access.
Security and policy decisions are recorded in [justifications.md](justifications.md).
