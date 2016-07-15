FROM wlezzar/confluent:2.0.1

ENV ZOOKEEPER_CONF_dataDir=/data/zookeeper-data \
    ZOOKEEPER_CONF_clientPort=2181 \
    ZOOKEEPER_CONF_maxClientCnxns=0

COPY zookeeper.properties.tmpl entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
