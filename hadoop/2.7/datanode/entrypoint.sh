#!/bin/bash

# Configure hadoop using environment variables
/configure-hadoop.sh

# Wait for hosts
/utils/wait-for-hosts.sh

if [ "$#" -eq 0 ]; then
    
    # check that all required configuration properties are set
    if [[ -z "$HDFS_SITE_dfs__datanode__data__dir" ]]; then
        echo "HDFS_SITE_dfs__datanode__data__dir is not set"
        exit 1
    fi

    exec "hdfs" "datanode"
else
    exec "$@"
fi
