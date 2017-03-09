#!/bin/bash
source version

docker build -t wlezzar/jmxtrans:$TAG base
docker build -t wlezzar/jmxtrans-kafka:$TAG jmx-trans-kafka
