FROM wlezzar/jmxtrans:263

COPY kafka.json run-jmxtrans-kafka.sh /

ENV FILENAME=/kafka.json \
    KAFKA_JMX_PORT=9999 \
    KAFKA_JMX_HOST=localhost \
    INFLUXDB_HOST=localhost \
    INFLUXDB_PORT=8086 \
    INFLUXDB_DBNAME=kafka \
    INFLUXDB_USER=admin \
    INFLUXDB_PASSWORD=admin

CMD ["/run-jmxtrans-kafka.sh"]