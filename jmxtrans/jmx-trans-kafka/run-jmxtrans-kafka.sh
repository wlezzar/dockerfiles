#!/bin/bash

if [[ "$KAFKA_JMX_HOST" == "localhost" ]]; then
  DEFAULT_ALIAS=$(hostname)
else
  DEFAULT_ALIAS="$KAFKA_JMX_HOST"
fi

: ${KAFKA_JMX_ALIAS:=$DEFAULT_ALIAS}

export JMXTRANS_OPTS="${JMXTRANS_OPTS} -DkafkaPort=${KAFKA_JMX_PORT} -DkafkaHost=${KAFKA_JMX_HOST} -DkafkaAlias=${KAFKA_JMX_ALIAS} -DinfluxUrl=http://${INFLUXDB_HOST}:${INFLUXDB_PORT}/ -DinfluxDb=${INFLUXDB_DBNAME} -DinfluxUser=${INFLUXDB_USER} -DinfluxPwd=${INFLUXDB_PASSWORD}"

exec "/run-jmxtrans.sh"