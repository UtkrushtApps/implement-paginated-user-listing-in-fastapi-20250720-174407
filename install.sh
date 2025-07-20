#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="paginated-items-service"
CONTAINER_NAME="paginated-items-container"

echo "[install.sh] Building Docker image: $IMAGE_NAME"
docker build -t "$IMAGE_NAME" .

echo "[install.sh] Cleaning up any existing container..."
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
  docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
fi

echo "[install.sh] Starting new container: $CONTAINER_NAME"
docker run -d --name "$CONTAINER_NAME" -p 8000:8000 "$IMAGE_NAME"

echo "[install.sh] Container is up and running. Access the API at http://localhost:8000/items?limit=5&offset=0"
