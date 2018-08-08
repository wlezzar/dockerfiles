FROM wlezzar/java:8

ENV HADOOP_MAJOR_VERSION=2.7 SPARK_VERSION=2.3.1 SPARK_HOME=/usr/spark

ENV PATH=$PATH:${SPARK_HOME}/bin

# Install spark
RUN curl -s --retry 3 \
   "http://mirror.ibcp.fr/pub/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_MAJOR_VERSION}.tgz" \
   | gunzip \
   | tar x -C /usr/ \
   && mv /usr/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_MAJOR_VERSION} $SPARK_HOME

# Install dependencies 
ENV HADOOP_MINOR_VERSION=3 AWS_SDK_VERSION=1.7.4
ENV HADOOP_VERSION="${HADOOP_MAJOR_VERSION}.${HADOOP_MINOR_VERSION}"
RUN wget -O ${SPARK_HOME}/jars/hadoop-aws.jar "http://central.maven.org/maven2/org/apache/hadoop/hadoop-aws/${HADOOP_VERSION}/hadoop-aws-${HADOOP_VERSION}.jar" \
 && wget -O ${SPARK_HOME}/jars/aws-sdk.jar "http://central.maven.org/maven2/com/amazonaws/aws-java-sdk/${AWS_SDK_VERSION}/aws-java-sdk-${AWS_SDK_VERSION}.jar" \
 || echo "failed to download dependencies" && break

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

WORKDIR $SPARK_HOME
CMD ["spark-shell"]


