FROM wlezzar/java:8

ENV CONFLUENT_ARCHIVE_VERSION=3.1 \
    CONFLUENT_VERSION=3.1.1 \
    CONFLUENT_SCALA_VERSION=2.11

ENV CONFLUENT_HOME=/opt/confluent-$CONFLUENT_VERSION
ENV PATH=$PATH:$CONFLUENT_HOME/bin

# Install confluent
RUN curl -L --retry 3 \
      http://packages.confluent.io/archive/$CONFLUENT_ARCHIVE_VERSION/confluent-$CONFLUENT_VERSION-$CONFLUENT_SCALA_VERSION.tar.gz \
      | tar -zx -C /opt && \
    rm -rf $CONFLUENT_HOME/share/doc
