#!/bin/bash

# Configure hadoop using environment variables
/configure-hadoop.sh

# Configure hive
echo "Configuring hive"
dockerize -template /hive-site.xml | grep -ve "^\s*$" > $HIVE_HOME/conf/hive-site.xml

# Wait for hosts
/utils/wait-for-hosts.sh

if [ "$#" -eq 0 ]; then
    echo "creating required hadoop directories"
    hadoop fs -mkdir /tmp
    hadoop fs -mkdir -p /user/hive/warehouse
    hadoop fs -chmod g+w /user/hive/warehouse
    hadoop fs -chmod g+w /user/hive/warehouse
    
    exec "hiveserver2"
else
    exec "$@"
fi
