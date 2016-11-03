#!/bin/bash
set -e

TAG=1.6.2-hadoop-2.6

docker build -t wlezzar/spark:$TAG .
