FROM debian:latest

# Install dockerize
ENV DOCKERIZE_VERSION=v0.2.1
RUN BUILD_PACKAGES=curl && \
    apt-get update && apt-get install $BUILD_PACKAGES -y && \
    curl -sL --retry 3 \
        https://github.com/wlezzar/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-$DOCKERIZE_VERSION.tar.gz \
      | tar -zx -C /usr/local/bin && \
    apt-get remove --purge -y $BUILD_PACKAGES $(apt-mark showauto) && rm -rf /var/lib/apt/lists/  

# Copy burrow and config
COPY burrow /usr/local/bin/burrow
COPY config /burrow/config
COPY entrypoint.sh /entrypoint.sh

# Default configuration
ENV BURROW_CLIENT_ID="burrow-lagchecker" \
    BURROW_ZOOKEEPER_HOSTS="localhost:2181" \
    BURROW_KAFKA_CLUSTER_NAME="kafka-cluster" \
    BURROW_KAFKA_HOSTS="localhost:9092" \
    BURROW_KAFKA_ZOOKEEPER_PATH="/" \
    BURROW_BROKER_OFFSETS="60" \
    BURROW_LAGCHECK_INTERVAL="10" \
    BURROW_GROUP_BLACKLIST='^(console-consumer-|python-kafka-consumer-).*$'

ENTRYPOINT ["/entrypoint.sh"]