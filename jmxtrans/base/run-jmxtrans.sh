#!/bin/bash

/utils/wait-for-hosts.sh

echo "starting..."

JAR_FILE="/usr/share/jmxtrans/lib/jmxtrans-all.jar"

JMXTRANS_OPTS="${JMXTRANS_OPTS} -Djmxtrans.log.level=${LOG_LEVEL} -Dlog4j.configuration=${LOG4J_CONFIGURATION_FILE}"
MONITOR_OPTS="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=${JMX_PORT}  -Dcom.sun.management.jmxremote.rmi.port=${JMX_PORT}"
GC_OPTS="-Xms${HEAP_SIZE}m -Xmx${HEAP_SIZE}m -XX:PermSize=${PERM_SIZE}m -XX:MaxPermSize=${MAX_PERM_SIZE}m"

if [ "${ADDITIONAL_JARS}" == "" ]; then
  ADDITIONAL_JARS_OPTS=""
else
  ADDITIONAL_JARS_OPTS="-a ${ADDITIONAL_JARS}"
fi

if [ -z "$FILENAME" ]; then
    EXEC="-jar $JAR_FILE -e -j $JSON_DIR -s $SECONDS_BETWEEN_RUNS -c $CONTINUE_ON_ERROR $ADDITIONAL_JARS_OPTS"
else
    EXEC="-jar $JAR_FILE -e -f $FILENAME -s $SECONDS_BETWEEN_RUNS -c $CONTINUE_ON_ERROR $ADDITIONAL_JARS_OPTS"
fi

echo "exec details : ${EXEC}"
echo "INIT.."
echo java -server $JAVA_OPTS $JMXTRANS_OPTS $GC_OPTS $MONITOR_OPTS $EXEC
exec java -server $JAVA_OPTS $JMXTRANS_OPTS $GC_OPTS $MONITOR_OPTS $EXEC
