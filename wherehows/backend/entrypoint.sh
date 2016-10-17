#!/bin/bash

CONFIG_FILE=$BACKEND_HOME/conf/application.conf

# create configuration file
dockerize -template /application.conf.tmpl | grep -ve "^\s*$" | awk '{$1=$1};1' > $CONFIG_FILE

# Wait for hosts
/utils/wait-for-hosts.sh

if [ "$#" -eq 0 ]; then
    exec "$BACKEND_HOME/bin/backend-service" "-Dconfig.file=$CONFIG_FILE"
else
    exec "$@"
fi
