#!/bin/bash
echo "Configuring hadoop"

HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-"$HADOOP_HOME/etc/hadoop"}
TEMPLATES_DIR=${TEMPLATES_DIR:-"/templates"}

# setting default CORE_SITE_fs__defaultFs to hostname if not already set
export CORE_SITE_fs__defaultFS=${CORE_SITE_fs__defaultFS:-"hdfs://$(hostname -f):8020"}

# create configuration files
for FILE_NAME in $(ls $TEMPLATES_DIR); do
    echo "- rendering template : $TEMPLATES_DIR/$FILE_NAME"
    dockerize -template $TEMPLATES_DIR/$FILE_NAME | grep -ve "^\s*$" > $HADOOP_CONF_DIR/$FILE_NAME
done
