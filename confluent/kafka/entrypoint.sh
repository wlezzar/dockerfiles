#!/bin/bash
set -e

CONFIG_FILE=/server.properties

if [[ -z "$KAFKA_CONF_advertised_host_name" && -n "$ADVERTISE_INTERFACE" ]]; then
	ip -o -4 addr list $ADVERTISE_INTERFACE || exit 1
	export KAFKA_CONF_advertised_host_name=$(ip -o -4 addr list $ADVERTISE_INTERFACE | awk '{print $4}' | cut -d/ -f1)
	echo "KAFKA_CONF_advertised_host_name set to : $KAFKA_CONF_advertised_host_name"
fi

# create kafka configuration file
dockerize -template /server.properties.tmpl | grep -ve "^\s*$" | awk '{$1=$1};1' > $CONFIG_FILE

if [ "$#" -eq 0 ]; then
	# add zookeeper to the list of applications to wait for
	WAIT_FOR_TCP="$KAFKA_CONF_zookeeper_connect,$WAIT_FOR_TCP"
	# wait for applications
	if [[ -n "$WAIT_FOR_TCP" ]]; then
		for TCP_URL in $(echo "$WAIT_FOR_TCP" | sed s/,/" "/g | cut -d"/" -f1); do
			dockerize -wait tcp://$TCP_URL -timeout 60s
		done
	fi
	# launch kafka
	exec "kafka-server-start" "$CONFIG_FILE"
else
  exec "$@"
fi
