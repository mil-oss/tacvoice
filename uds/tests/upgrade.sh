#!/usr/bin/env bash
# Upgrade test: deploy the previous package ref, then the current one, and assert
# the workload stays healthy across the upgrade.
#
# Usage: PREV_PACKAGE=zarf-package-tacvoice-amd64-0.1.0-uds.0.tar.zst ./upgrade.sh
# Until a prior release exists, this deploys the current package twice (idempotent
# redeploy), which still exercises the in-place upgrade path.
set -euo pipefail

cd "$(dirname "$0")/.."
REPO_ROOT="$(pwd)"

# shellcheck source=../service/scripts/scratch_dirs.sh
source "${REPO_ROOT}/service/scripts/scratch_dirs.sh"
scratch_dirs_init

NS="${TACVOICE_NS:-tacvoice}"
APP="${TACVOICE_APP:-tacvoice}"
CUR_PACKAGE="${CUR_PACKAGE:-zarf-package-tacvoice-amd64-0.1.0-uds.0.tar.zst}"
PREV_PACKAGE="${PREV_PACKAGE:-${CUR_PACKAGE}}"
K="uds zarf tools kubectl"

if [ ! -f "${PREV_PACKAGE}" ]; then
  echo "[upgrade] building current package as the baseline"
  uds zarf package create . --confirm --tmpdir "${TMPDIR}" --zarf-cache "${UDS_CACHE}"
fi

echo "[upgrade] deploying previous package: ${PREV_PACKAGE}"
uds zarf package deploy "${PREV_PACKAGE}" --confirm --tmpdir "${TMPDIR}" --zarf-cache "${UDS_CACHE}"
${K} rollout status "deployment/${APP}" -n "${NS}" --timeout=300s

echo "[upgrade] deploying current package: ${CUR_PACKAGE}"
uds zarf package deploy "${CUR_PACKAGE}" --confirm --tmpdir "${TMPDIR}" --zarf-cache "${UDS_CACHE}"
${K} rollout status "deployment/${APP}" -n "${NS}" --timeout=300s

echo "[upgrade] running journey checks"
./tests/journey.sh

echo "[upgrade] PASS"
