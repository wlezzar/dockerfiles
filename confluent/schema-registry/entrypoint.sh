#!/bin/bash
set -e

CONFIG_FILE=/schema-registry.properties

# create schema-registry configuration file
dockerize -template /schema-registry.properties.tmpl | grep -ve "^\s*$" | awk '{$1=$1};1' > $CONFIG_FILE

if [ "$#" -eq 0 ]; then
	# wait for zookeeper
	ZOOKEEPER_URL=$(echo "$SR_CONF_kafkastore_connection_url" | cut -d"," -f1 | cut -d"/" -f1)
	WAIT_FOR_TCP="$ZOOKEEPER_URL,$WAIT_FOR_TCP"
	# wait for applications
	if [[ -n "$WAIT_FOR_TCP" ]]; then
		for TCP_URL in $(echo "$WAIT_FOR_TCP" | sed s/,/" "/g ); do
			dockerize -wait tcp://$TCP_URL -timeout 60s
		done
	fi
	# launch schema-registry
	exec "schema-registry-start" "$CONFIG_FILE"
else
  exec "$@"
fi
