# Justifications

Records design decisions relevant to UDS Package Requirements compliance.

## No Pepr Exemptions

The package ships with no `Exemption` CRs. All containers run as non-root
(uid/gid 65532) with `allowPrivilegeEscalation: false`, all Linux capabilities
dropped, and `seccompProfile: RuntimeDefault` (chart `securityContext` /
`podSecurityContext`, and a matching `USER` in the `Containerfile`). The service
binaries listen only on high ports (>1024), so no privileged-port capability is
needed.

If a future binary requires a privileged port or capability, capture the exact
requirement here and add a narrowly scoped `Exemption` rather than relaxing the
pod-wide securityContext.

## Istio Ambient (no sidecar workaround)

The workload runs in Istio **ambient** mode (`spec.network.serviceMesh.mode:
ambient`). Ambient's ztunnel captures only north-south traffic and never the
in-pod loopback sockets, so the previous `traffic.sidecar.istio.io/exclude*Ports`
annotations are removed entirely. This is cleaner than the sidecar approach, which
required explicitly excluding the FIPS port ranges from capture.

## FIPS mTLS bridge

The nine ZT/service containers speak the application's own FIPS mTLS (aws-lc-fips)
over `127.0.0.1`. Mesh mTLS (ambient/ztunnel) handles north-south traffic to the
web edge. The two planes never overlap: loopback is uncaptured, so there is no
double-encryption. For an end-to-end FIPS story, deploy UDS Core Keycloak in FIPS
mode (BCFIPS variant) via a `core-slim-dev` bundle override; the app already links
aws-lc-fips.

## Monitors: uptime probes (no app /metrics yet)

TacVoice exposes no Prometheus `/metrics` endpoint, so there is no `monitor`
PodMonitor/ServiceMonitor. The Package CR declares `uptime.checks` on the tenant
expose entry (`/` and `/.well-known/tacvoice/oidc.json`); the UDS Operator
provisions Blackbox probes for HTTPS availability (Probe Uptime dashboard).

Container logs (Vector → Loki) and Istio/kube metrics provide the rest of
operational visibility. If a metrics endpoint is added later, add a `monitor`
entry to the Package CR per doc/llms-full.txt.

## Writable state

Each container's `$HOME` (`/home/ztxs`) and LMDB ledger are backed by a shared
`emptyDir` mounted per-container via `subPath`, owned by `fsGroup: 65532` so the
non-root uid can write. State is ephemeral by design (static message/voice data is
embedded in the binaries via rust-embed; transcriptions/results publish to the
orderwire, not local disk).
