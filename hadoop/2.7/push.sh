#!/bin/bash
set -e

TAG=2.7

docker push wlezzar/hadoop:$TAG
docker push wlezzar/hdfs-namenode:$TAG
docker push wlezzar/hdfs-datanode:$TAG