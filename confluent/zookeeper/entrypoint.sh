#!/bin/bash
set -e

CONFIG_FILE=/zookeeper.properties

# create zookeeper configuration file
dockerize -template /zookeeper.properties.tmpl | grep -ve "^\s*$" | awk '{$1=$1};1' > $CONFIG_FILE

if [ "$#" -eq 0 ]; then
	exec "zookeeper-server-start" "$CONFIG_FILE"
else
  exec "$@"
fi
