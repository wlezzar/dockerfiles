FROM wlezzar/confluent:3.1.1

ENV KAFKA_REST_CONF_id=kafka-rest-test-server \
    KAFKA_REST_CONF_schema_registry_url=http://localhost:8081 \
    KAFKA_REST_CONF_zookeeper_connect=localhost:2181

COPY kafka-rest.properties.tmpl entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
