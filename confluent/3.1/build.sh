#!/bin/bash
set -e

TAG=3.1.1

docker build -t wlezzar/confluent:$TAG base
docker build -t wlezzar/zookeeper:confluent-$TAG zookeeper
docker build -t wlezzar/zookeeper-exhibitor:confluent-$TAG zookeeper-exhibitor
docker build -t wlezzar/kafka:confluent-$TAG kafka
docker build -t wlezzar/schema-registry:confluent-$TAG schema-registry
docker build -t wlezzar/kafka-rest:confluent-$TAG kafka-rest
