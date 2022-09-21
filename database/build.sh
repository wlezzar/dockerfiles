#!/bin/bash
set -e

TAG=1.0

docker buildx build \
    --platform=linux/amd64 \
    -t wlezzar/postgres-with-data:$TAG \
    $(dirname $0)
