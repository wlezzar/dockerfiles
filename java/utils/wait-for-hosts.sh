#!/bin/bash
if [[ -n "$WAIT_FOR_TCP" ]]; then
	for TCP_URL in $(echo "$WAIT_FOR_TCP" | sed s/,/" "/g | cut -d"/" -f1); do
		dockerize -wait tcp://$TCP_URL -timeout 60s
	done
else
    echo "No hosts to wait for !"
fi