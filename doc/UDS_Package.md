# UDS Package Distribution

Ref:

- [doc/llms-full.txt](llms-full.txt)
- https://docs.defenseunicorns.com/core/how-to-guides/packaging-applications/create-uds-package/
- [uds/docs/README.md](../uds/docs/README.md)

Project:

- [doc/project.md](project.md)
- [service/](../service/)

## Background

TacVoice must deploy on **someone else's UDS cluster** — not only the local k3d dev stack. Distribution is via:

1. **Tarballs** in `uds_package/` (hand-off or file share)
2. **OCI registry** (`uds publish` / `uds pull`) — Phase 2, standard GHCR

A future **ZTXS-backed private registry** (Keycloak-gated, ledger provenance) is described in [UDS_Repository.md](UDS_Repository.md) and deferred to Phase 3.

## Build

From the repo root (Docker Engine + `uds` CLI + `wasm-pack` required):

```bash
./service/scripts/build_uds_package.sh
```

Options:

| Flag | Effect |
|------|--------|
| `--skip-docker` | Repackage only; requires `localhost/tacvoice:latest` locally |
| `--output DIR` | Output directory (default: `uds_package/`) |

### Artifacts in `uds_package/`

| File | Purpose |
|------|---------|
| `zarf-package-tacvoice-amd64-*.tar.zst` | App Zarf package (image + chart + embedded SBOM) |
| `uds-bundle-tacvoice-app-amd64-*.tar.zst` | App-only UDS bundle for `uds deploy` |
| `sbom/` | Extracted image SBOMs |
| `manifest.json` | Provenance: version, `tacvoice_tag`, digests, git ref |
| `checksums.sha256` | Integrity hashes |
| `uds-config-app.yaml` | Consumer cluster variable template |

### `manifest.json` fields

| Field | Description |
|-------|-------------|
| `package` | Package name (`tacvoice`) |
| `version` | Zarf package version (`0.1.0-uds.0`) |
| `bundle_version` | UDS bundle version (`0.1.0`) |
| `tacvoice_tag` | Immutable image tag for deploy (`--set-variables TACVOICE_TAG=...`) |
| `image` | Source registry reference used at build time |
| `image_digest` | Full image digest (sha256) |
| `zarf_package` | Zarf tarball filename |
| `uds_bundle` | UDS bundle tarball filename |
| `built_at` | UTC build timestamp |
| `git_ref` | Short git commit at build time |

## Publish (OCI / GHCR)

Authenticate to the target registry:

```bash
echo "$GHCR_TOKEN" | docker login ghcr.io -u "$GHCR_USER" --password-stdin
```

Publish the app-only bundle:

```bash
OCI_BUNDLE_REF=oci://ghcr.io/myorg/uds-bundles/tacvoice:0.1.0 \
  ./service/scripts/publish_uds_package.sh
```

Optional — publish the Zarf package directly (for consumers who deploy packages, not bundles):

```bash
OCI_ZARF_REF=oci://ghcr.io/myorg/uds-packages/tacvoice:0.1.0-uds.0 \
  PUBLISH_ZARF=1 ./service/scripts/publish_uds_package.sh --zarf-only
```

Environment variables:

| Variable | Purpose |
|----------|---------|
| `OCI_BUNDLE_REF` | Target OCI ref for the UDS bundle |
| `OCI_ZARF_REF` | Target OCI ref for the Zarf package (`--zarf-only`) |
| `GHCR_USER` / `GHCR_TOKEN` | Used with `docker login ghcr.io` |

## Consume (remote UDS cluster)

### Prerequisites

The target cluster must already run **UDS Core** (Istio ambient, Keycloak, Pepr). TacVoice does **not** ship k3d or Core.

| Requirement | Value / action |
|-------------|----------------|
| Tenant `domain` | Cluster tenant domain (e.g. `uds.dev` → `https://tacvoice.uds.dev`) |
| OIDC issuer | `https://sso.<domain>/realms/uds` (chart default) |
| OIDC JWKS | `http://keycloak-http.keycloak.svc.cluster.local:8080/realms/uds/protocol/openid-connect/certs` |
| OIDC client | `uds-tac-tacvoice` (provisioned by Package CR) |
| `ALLOW_PUBLIC_CLIENTS` | `true` on UDS Core operator config (PKCE public client) |
| Istio ambient | Enabled on `tacvoice` namespace (operator labels from Package CR) |
| `TACVOICE_TAG` | From `manifest.json` → `tacvoice_tag` |

No policy IP addresses are required — the chart uses Kubernetes DNS and the Package CR handles mesh exposure.

Copy [uds/uds-config-app.yaml](../uds/uds-config-app.yaml) to `uds-config.yaml` on the consumer side and set `shared.domain` and `TACVOICE_TAG`.

### Mode A — Zarf package tarball

```bash
TACVOICE_TAG=<from manifest.json>
uds zarf package deploy zarf-package-tacvoice-*.tar.zst --confirm \
  --set-variables TACVOICE_TAG="${TACVOICE_TAG}" \
  --tmpdir "${TMPDIR}" --zarf-cache "${UDS_CACHE}"
```

### Mode B — App-only UDS bundle

```bash
# Optional: UDS_CONFIG=uds-config.yaml uds deploy ...
uds deploy uds-bundle-tacvoice-app-*.tar.zst --confirm \
  --tmpdir "${TMPDIR}" --uds-cache "${UDS_CACHE}"
```

### Mode C — Pull from OCI

```bash
uds pull oci://ghcr.io/myorg/uds-bundles/tacvoice:0.1.0 -o ./pull \
  --tmpdir "${TMPDIR}" --uds-cache "${UDS_CACHE}"
uds deploy ./pull/uds-bundle-*.tar.zst --confirm \
  --tmpdir "${TMPDIR}" --uds-cache "${UDS_CACHE}"
```

Verify deployment:

```bash
uds zarf tools kubectl -n tacvoice rollout status deploy/tacvoice --timeout=600s
curl -sk -o /dev/null -w '%{http_code}\n' "https://tacvoice.<domain>/"
```

## Local development (unchanged)

Full local stack (k3d + UDS Core slim-dev + TacVoice):

```bash
./service/scripts/tacvoice_up.sh          # build via build_uds_package.sh + deploy
./service/scripts/tacvoice_down.sh        # remove app
./service/scripts/remove_uds.sh           # full teardown
```

The dev bundle ([uds/uds-bundle.yaml](../uds/uds-bundle.yaml)) includes k3d, Zarf init, and Core — use it only for local laptop dev, not for distribution.

## Future: ZTXS Registry (Phase 3)

See [UDS_Repository.md](UDS_Repository.md). Planned capabilities:

- Private OCI storage for bundles and Zarf packages
- Keycloak-gated publish/pull
- Ledger provenance (source, version, age, build log references)
- Catalog UI comparable to UDS Registry

Not implemented in this phase.
