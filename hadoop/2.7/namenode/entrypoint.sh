#!/bin/bash
set -e 

# Configure hadoop using environment variables
/configure-hadoop.sh

# Wait for hosts
/utils/wait-for-hosts.sh

if [ "$#" -eq 0 ]; then
    
    # check that all required configuration properties are set
    if [[ -z "$HDFS_SITE_dfs__namenode__name__dir" ]]; then
        echo "HDFS_SITE_dfs__namenode__name__dir is not set"
        exit 1
    fi

    # If namenode's folder is empy, format it
    namedir=$(echo $HDFS_SITE_dfs__namenode__name__dir | perl -pe 's#file://##')
    if [[ "$(ls -A $namedir)" == "" ]]; then
        echo "Formatting namenode"
        hdfs --config $HADOOP_CONF_DIR namenode -format
    fi

    exec "hdfs" "namenode"
else
echo "adazad"
    exec "$@"
fi
