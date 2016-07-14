#!/bin/bash

if [ -z "$SPARK_INTERFACE" ]; then
  echo "SPARK_INTERFACE not set. Using the first found interface."
else
  echo "Using $SPARK_INTERFACE to bind the spark master."
  export SPARK_LOCAL_IP=$(ip -o -4 addr list $SPARK_INTERFACE | awk '{print $4}' | cut -d/ -f1)
  echo "SPARK_LOCAL_IP : $SPARK_LOCAL_IP"
fi

exec "$@"
