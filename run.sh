#!/usr/bin/env bash
set -euo pipefail

./install.sh

echo "[run.sh] Waiting for service to initialize..."
sleep 3

STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:8000/items?limit=5&offset=0")
if [ "$STATUS_CODE" -eq 200 ]; then
  echo "[run.sh] Service health check passed (HTTP 200)."
else
  echo "[run.sh] Service health check failed (HTTP $STATUS_CODE)." >&2
  exit 1
fi
