#!/bin/bash
set -e

TAG=3.0.1

docker push wlezzar/confluent:$TAG
docker push wlezzar/zookeeper:confluent-$TAG
docker push wlezzar/zookeeper-exhibitor:confluent-$TAG
docker push wlezzar/kafka:confluent-$TAG
docker push wlezzar/schema-registry:confluent-$TAG
docker push wlezzar/kafka-rest:confluent-$TAG
