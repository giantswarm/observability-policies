#!/usr/bin/env bash
# This script downloads the CRD definitions needed for chainsaw tests into hack/crds/.
# Run this script manually to update the CRDs when upstream versions change.
#
# Sources:
#   prometheus-operator CRDs:
#     https://github.com/prometheus-operator/prometheus-operator/tree/main/example/prometheus-operator-crd

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CRD_DIR="${SCRIPT_DIR}/crds"

PROMETHEUS_OPERATOR_VERSION="v0.89.0"
PROMETHEUS_OPERATOR_BASE_URL="https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/${PROMETHEUS_OPERATOR_VERSION}/example/prometheus-operator-crd"

PROMETHEUS_OPERATOR_CRDS=(
  "monitoring.coreos.com_alertmanagerconfigs.yaml"
  "monitoring.coreos.com_alertmanagers.yaml"
  "monitoring.coreos.com_podmonitors.yaml"
  "monitoring.coreos.com_probes.yaml"
  "monitoring.coreos.com_prometheusagents.yaml"
  "monitoring.coreos.com_prometheuses.yaml"
  "monitoring.coreos.com_prometheusrules.yaml"
  "monitoring.coreos.com_scrapeconfigs.yaml"
  "monitoring.coreos.com_servicemonitors.yaml"
  "monitoring.coreos.com_thanosrulers.yaml"
)

mkdir -p "${CRD_DIR}"

echo "Downloading prometheus-operator CRDs (${PROMETHEUS_OPERATOR_VERSION})..."
for crd in "${PROMETHEUS_OPERATOR_CRDS[@]}"; do
  echo "  ${crd}"
  curl -sSf "${PROMETHEUS_OPERATOR_BASE_URL}/${crd}" -o "${CRD_DIR}/${crd}"
done

echo "Done. CRDs written to ${CRD_DIR}/"
