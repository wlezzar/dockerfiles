FROM openjdk:8

ENV DOCKERIZE_VERSION=v0.2.1

# Install dockerize
RUN curl -sL --retry 3 \
      https://github.com/wlezzar/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-$DOCKERIZE_VERSION.tar.gz \
      | tar -zx -C /usr/local/bin

COPY utils /utils