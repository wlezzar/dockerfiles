#!/bin/bash
set -e

if [[ $# -lt 1 ]]; then
  echo "Usage : $0 <tag>"
  exit 1
fi

TAG=$1

docker push wlezzar/zookeeper:$TAG
docker push wlezzar/zookeeper-exhibitor:$TAG
docker push wlezzar/kafka:$TAG
docker push wlezzar/schema-registry:$TAG
docker push wlezzar/kafka-rest:$TAG
