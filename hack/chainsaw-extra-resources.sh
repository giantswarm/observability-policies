#!/usr/bin/env bash
# This script applies extra CRDs to the test cluster before running chainsaw tests.
# It is meant to be called from the CI pipeline or locally before running chainsaw.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CRD_DIR="${SCRIPT_DIR}/crds"

echo "Applying extra CRDs from ${CRD_DIR}..."
kubectl apply --server-side -f "${CRD_DIR}/"
echo "Done."
