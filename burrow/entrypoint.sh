#!/bin/bash

BURROW_CONFIG_FILE=/burrow/config/burrow.cfg

dockerize -template $BURROW_CONFIG_FILE.tmpl | grep -ve "^\s*$" | awk '{$1=$1};1' > $BURROW_CONFIG_FILE

echo "Result config : "
cat $BURROW_CONFIG_FILE

if [ "$#" -eq 0 ]; then
	# add zookeeper and kafka to the list of applications to wait for
	WAIT_FOR_TCP="$BURROW_ZOOKEEPER_HOSTS,$BURROW_KAFKA_HOSTS,$WAIT_FOR_TCP"
	# wait for applications
	if [[ -n "$WAIT_FOR_TCP" ]]; then
		for TCP_URL in $(echo "$WAIT_FOR_TCP" | sed s/,/" "/g | cut -d"/" -f1); do
			dockerize -wait tcp://$TCP_URL -timeout 60s
		done
	fi
	# launch burrow
	if [[ -n "$PAUSE_BEFORE_START" ]]; then
		echo "Pausing $PAUSE_BEFORE_START seconds before start"
		sleep $PAUSE_BEFORE_START
	fi
	exec dockerize -stdout /tmp/burrow.log -stdout /tmp/burrow.out "burrow" "--config" "$BURROW_CONFIG_FILE"
else
  exec "$@"
fi
 
