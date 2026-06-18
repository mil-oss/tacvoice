# Monitoring & Observability

Ref: [doc/llms-full.txt](../../doc/llms-full.txt) (Logging, Monitoring & Observability).

UDS Core ships **Prometheus**, **Grafana**, **Alertmanager**, **Blackbox Exporter**,
**Vector**, and **Loki**. TacVoice on UDS uses this stack for deployment visibility:
container logs, mesh metrics, pod health, and HTTPS uptime probes.

The platform defaults to **k3d-core-demo** (full Core with Grafana, Loki,
Prometheus). Slim-only clusters (`k3d-core-slim-dev`) cannot add observability
incrementally — see [install_uds_observability.sh](../install_uds_observability.sh).

## Quick access (local k3d)

After `./service/scripts/tacvoice_up.sh`:

| UI | URL |
| --- | --- |
| Grafana | https://grafana.admin.uds.dev |
| Keycloak admin | https://keycloak.admin.uds.dev |
| TacVoice app | https://tacvoice.uds.dev |

`*.uds.dev` resolves to the k3d load balancer on localhost. No DNS setup required.

**Login:** Grafana uses Keycloak SSO. Users need `/UDS Core/Admin` (full) or
`/UDS Core/Auditor` (read-only). For local dev, create an admin user:

```bash
uds run common-setup:keycloak-user --set KEYCLOAK_USER_GROUP="/UDS Core/Admin"
```

Default dev credentials (never use in production): `doug` / `unicorn123!@#UN`.

If admin URLs fail on `:443` (host k3s leftovers), use the admin gateway forward:

```bash
./uds/observability.sh start
# then open https://grafana.admin.uds.dev:19443/
```

## Helper script

[observability.sh](../observability.sh):

```bash
./uds/observability.sh urls      # sample PromQL / LogQL queries
./uds/observability.sh diag      # stack + HTTPS reachability
./uds/observability.sh verify    # post-deploy smoke (namespaces)
./uds/observability.sh start     # port-forward admin gateway :19443
```

Or via tasks: `uds run -f uds/tasks.yaml observability-diag`.

## What TacVoice exposes today

| Signal | Source | Notes |
| --- | --- | --- |
| Container logs | stdout/stderr → Vector → Loki | All ten containers; no opt-in |
| HTTPS uptime | Blackbox probe via Package CR | `uptime.checks` on `/` and OIDC config |
| Pod / mesh metrics | kube-state, Istio | Via platform Prometheus scrape |
| App Prometheus metrics | N/A | No `/metrics` endpoint yet |

The [Package CR](../chart/templates/uds-package.yaml) declares `uptime.checks` on
the tenant expose entry. The UDS Operator creates a Blackbox probe; results appear
in **Dashboards → UDS / Monitoring / Probe Uptime**.

## Grafana: TacVoice queries

**Explore → Prometheus**

```text
# TacVoice HTTPS edge (blackbox)
probe_success{namespace="tacvoice"}
probe_http_status_code{namespace="tacvoice"}

# Pod restarts across the 10-container pod
kube_pod_container_status_restarts_total{namespace="tacvoice"}

# Istio request rate to the web edge
sum(rate(istio_requests_total{destination_service_namespace="tacvoice"}[5m]))
  by (destination_service_name, response_code)
```

**Explore → Loki**

```text
# All TacVoice namespace logs
{namespace="tacvoice"}

# Web edge only
{namespace="tacvoice", container="tacvoice"}

# Transcription / recognition workers
{namespace="tacvoice", container=~"transcriber|recognizer"} |= "error"

# Key service init (must start before other ZT containers)
{namespace="tacvoice", container="tvks"}
```

## kubectl fallbacks

When Grafana is unavailable:

```bash
uds zarf tools kubectl get pods -n tacvoice
uds zarf tools kubectl get package tacvoice -n tacvoice
uds zarf tools kubectl logs -n tacvoice deploy/tacvoice -c tacvoice --tail=200
uds zarf tools kubectl describe package tacvoice -n tacvoice
```

## Upgrade an existing slim-dev cluster

`k3d-core-slim-dev` has no observability stack. These approaches **do not work**:

- `--packages core-logging,core-monitoring` — not valid package names in `k3d-core-demo`
- `--packages core` on slim-dev — Helm CRD ownership conflict (`gateway-api-crds`)

Redeploy with the full demo bundle:

```bash
./service/scripts/remove_uds.sh
UDS_CORE_BUNDLE=k3d-core-demo:1.6.0 ./service/scripts/install_uds.sh
./service/scripts/tacvoice_up.sh
```

If a partial `core` deploy left the cluster unhealthy, `remove_uds.sh` is required
before retrying.

## Verify after deploy

```bash
./uds/install_uds_observability.sh
./uds/observability.sh verify
uds run -f uds/tasks.yaml test-observability
```

Check the Package CR reports probes:

```bash
uds zarf tools kubectl get package tacvoice -n tacvoice
# MONITORS column should list uptime probes when Ready
```

## Future: application metrics

When TacVoice adds a Prometheus `/metrics` endpoint on the web container, add a
`monitor` block to the Package CR (see podinfo example in llms-full.txt). Until
then, logs + uptime probes + Istio/kube metrics cover operational visibility.
