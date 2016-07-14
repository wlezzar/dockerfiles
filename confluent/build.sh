#!/bin/bash
set -e

if [[ $# -lt 1 ]]; then
  echo "Usage : $0 <tag>"
  exit 1
fi

TAG=$1

docker build -t wlezzar/zookeeper:$TAG zookeeper
docker build -t wlezzar/kafka:$TAG kafka
docker build -t wlezzar/schema-registry:$TAG schema-registry
docker build -t wlezzar/kafka-rest:$TAG kafka-rest
