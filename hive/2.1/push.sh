#!/bin/bash
set -e

TAG=2.1

docker push wlezzar/hive:$TAG
docker push wlezzar/hive-metastore-db:$TAG