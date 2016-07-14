FROM wlezzar/confluent:2.0.1

ENV KAFKA_CONF_listeners=PLAINTEXT://:9092 \
    KAFKA_CONF_num_network_threads=3 \
    KAFKA_CONF_num_io_threads=8 \
    KAFKA_CONF_socket_send_buffer_bytes=102400 \
    KAFKA_CONF_socket_receive_buffer_bytes=102400 \
    KAFKA_CONF_socket_request_max_bytes=104857600 \
    KAFKA_CONF_log_dirs=/tmp/kafka-logs \
    KAFKA_CONF_num_partitions=1 \
    KAFKA_CONF_num_recovery_threads_per_data_dir=1 \
    KAFKA_CONF_log_retention_hours=168 \
    KAFKA_CONF_log_segment_bytes=1073741824 \
    KAFKA_CONF_log_retention_check_interval_ms=300000 \
    KAFKA_CONF_zookeeper_connect=localhost:2181 \
    KAFKA_CONF_zookeeper_connection_timeout_ms=6000 \
    KAFKA_CONF_confluent_support_metrics_enable=true \
    KAFKA_CONF_confluent_support_customer_id=anonymous

COPY server.properties.tmpl entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
