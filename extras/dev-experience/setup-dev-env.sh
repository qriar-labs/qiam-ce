#!/bin/bash

# Endpoint URL for the Docker container
ENDPOINT="http://host.docker.internal:8080/api/endpoint"

# JSON payload
PAYLOAD='{"key1":"value1", "key2":"value2"}'

# Use Docker to run curl
docker run --rm curlimages/curl:latest \
    -X POST "$ENDPOINT" \
    -H "Content-Type: application/json" \
    -d "$PAYLOAD"