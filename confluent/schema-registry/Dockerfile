FROM wlezzar/confluent:2.0.1

ENV SR_CONF_port=8081 \
    SR_CONF_kafkastore_connection_url=localhost:2181 \
    SR_CONF_kafkastore_topic=_schemas \
    SR_CONF_debug=false

COPY schema-registry.properties.tmpl entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
