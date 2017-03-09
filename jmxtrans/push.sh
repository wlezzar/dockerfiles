#!/bin/bash
source version

docker push wlezzar/jmxtrans:$TAG
docker push wlezzar/jmxtrans-kafka:$TAG
