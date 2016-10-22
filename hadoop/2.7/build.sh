#!/bin/bash
set -e

TAG=2.7

docker build -t wlezzar/hadoop:$TAG base
docker build -t wlezzar/hdfs-namenode:$TAG namenode
docker build -t wlezzar/hdfs-datanode:$TAG datanode
