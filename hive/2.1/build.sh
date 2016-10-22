#!/bin/bash
set -e

TAG=2.1

docker build -t wlezzar/hive:$TAG hive
docker build -t wlezzar/hive-metastore-db:$TAG metastore-db
