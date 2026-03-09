#!/usr/bin/env bash
set -euo pipefail

KUSTOMIZE_OVERLAY=${1:-k8s/overlays/dev}

kubectl apply -k "$KUSTOMIZE_OVERLAY"
kubectl -n sre-demo rollout status deploy/sample-app
