FROM java:openjdk-8

ENV DOCKERIZE_VERSION=v0.2.1 \
    CONFLUENT_ARCHIVE_VERSION=3.0 \
    CONFLUENT_VERSION=3.0.1 \
    CONFLUENT_SCALA_VERSION=2.11

ENV CONFLUENT_HOME=/opt/confluent-$CONFLUENT_VERSION
ENV PATH=$PATH:$CONFLUENT_HOME/bin

# Install dockerize
RUN curl -sL --retry 3 \
      https://github.com/wlezzar/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-$DOCKERIZE_VERSION.tar.gz \
      | tar -zx -C /usr/local/bin

# Install confluent
RUN curl -L --retry 3 \
      http://packages.confluent.io/archive/$CONFLUENT_ARCHIVE_VERSION/confluent-$CONFLUENT_VERSION-$CONFLUENT_SCALA_VERSION.tar.gz \
      | tar -zx -C /opt && \
    rm -rf $CONFLUENT_HOME/share/doc
