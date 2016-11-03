#!/bin/bash
set -e

TAG=2.0.1-hadoop-2.7

docker build -t wlezzar/spark:$TAG .
