#!/bin/bash
set -e

TAG=2.3.1-hadoop-2.7

docker build -t wlezzar/spark:$TAG .
