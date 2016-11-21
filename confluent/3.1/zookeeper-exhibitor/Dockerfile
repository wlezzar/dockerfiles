FROM wlezzar/zookeeper:confluent-3.1.1

# Install supervisor
RUN apt-get update \
    && apt-get install -y supervisor \
    && rm -rf /var/lib/apt/lists/*

# Download exhibitor
ENV EXHIBITOR_VERSION=1.5.6

RUN curl -L --insecure --retry 3 -o /exhibitor.jar \
      https://github.com/wlezzar/exhibitor/releases/download/v$EXHIBITOR_VERSION/exhibitor-$EXHIBITOR_VERSION.jar

EXPOSE 8080

COPY supervisord.conf /supervisord.conf
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/supervisord.conf"]
