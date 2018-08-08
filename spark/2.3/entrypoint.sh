#!/bin/bash

if [ -n "$SPARK_INTERFACE" ]; then
  echo "Using $SPARK_INTERFACE to bind the spark master."
  export SPARK_LOCAL_IP=$(ip -o -4 addr list $SPARK_INTERFACE | awk '{print $4}' | cut -d/ -f1)
  echo "SPARK_LOCAL_IP : $SPARK_LOCAL_IP"
fi

# Wait for hosts
/utils/wait-for-hosts.sh

exec "$@"
