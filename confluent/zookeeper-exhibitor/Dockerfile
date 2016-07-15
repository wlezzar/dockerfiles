FROM wlezzar/zookeeper:confluent-3.0.0

# Install supervisor
RUN apt-get update \
    && apt-get install -y supervisor \
    && rm -rf /var/lib/apt/lists/*

# Download exhibitor
ENV EXHIBITOR_VERSION=1.5.6

RUN curl -L --retry 3 -o /exhibitor.jar \
      https://github.com/wlezzar/exhibitor/releases/download/v$EXHIBITOR_VERSION/exhibitor-$EXHIBITOR_VERSION.jar

COPY supervisord.conf /supervisord.conf
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/supervisord.conf"]
