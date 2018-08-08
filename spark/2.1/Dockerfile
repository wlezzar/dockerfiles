FROM wlezzar/java:8

ENV HADOOP_VERSION=2.7 SPARK_VERSION=2.1.1 SPARK_HOME=/usr/spark

ENV PATH=$PATH:${SPARK_HOME}/bin

# Install spark
RUN curl -s --retry 3 \
   "http://d3kbcqa49mib13.cloudfront.net/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz" \
   | gunzip \
   | tar x -C /usr/ \
   && mv /usr/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} $SPARK_HOME

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

WORKDIR $SPARK_HOME
CMD ["spark-shell"]
