FROM java:openjdk-8

ENV HADOOP_VERSION=2.7 SPARK_VERSION=2.0.1 DOCKERIZE_VERSION=v0.2.1

ENV SPARK_HOME=/usr/spark-${SPARK_VERSION} \
    SPARK_PACKAGE=spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}

ENV PATH=$PATH:${SPARK_HOME}/bin

# Install dockerize
RUN curl -sL --retry 3 \
      https://github.com/wlezzar/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-$DOCKERIZE_VERSION.tar.gz \
      | tar -zx -C /usr/local/bin

# Install spark
RUN curl -s --retry 3 \
   "http://d3kbcqa49mib13.cloudfront.net/${SPARK_PACKAGE}.tgz" \
   | gunzip \
   | tar x -C /usr/ \
   && mv /usr/$SPARK_PACKAGE $SPARK_HOME

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

WORKDIR $SPARK_HOME
CMD ["bin/spark-class", "org.apache.spark.deploy.master.Master"]
