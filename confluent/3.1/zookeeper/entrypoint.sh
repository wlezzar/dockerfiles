#!/bin/bash
set -e

CONFIG_FILE=/zookeeper.properties

# wait for hosts
/utils/wait-for-hosts.sh

# create zookeeper configuration file
dockerize -template /zookeeper.properties.tmpl | grep -ve "^\s*$" | awk '{$1=$1};1' > $CONFIG_FILE

# create zookeeper data dir if it doesn't exist
mkdir -p $ZOOKEEPER_CONF_dataDir

# Creating myid file (defaults to hostnames)
## MyID may be scripted
if [[ -n "$ZOOKEEPER_myid_expr" ]]; then
  eval "ZOOKEEPER_myid=$ZOOKEEPER_myid_expr"
else
  ZOOKEEPER_myid=${ZOOKEEPER_myid:-1}
fi

echo "$ZOOKEEPER_myid" > "$ZOOKEEPER_CONF_dataDir/myid"  

if [ "$#" -eq 0 ]; then
	exec "zookeeper-server-start" "$CONFIG_FILE"
else
  exec "$@"
fi
