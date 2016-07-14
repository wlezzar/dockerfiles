FROM java:openjdk-8

ENV HADOOP_VERSION=2.7.2 SPARK_VERSION=1.6.2

ENV HADOOP_HOME=/usr/hadoop-$HADOOP_VERSION \
    SPARK_HOME=/usr/spark-${SPARK_VERSION} \
    SPARK_PACKAGE=spark-${SPARK_VERSION}-bin-without-hadoop

ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop \
    SPARK_DIST_CLASSPATH="$HADOOP_HOME/etc/hadoop/*:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/hdfs/*:$HADOOP_HOME/share/hadoop/hdfs/lib/*:$HADOOP_HOME/share/hadoop/hdfs/*:$HADOOP_HOME/share/hadoop/yarn/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/mapreduce/*:$HADOOP_HOME/share/hadoop/tools/lib/*" \
    PATH=$PATH:${SPARK_HOME}/bin:$HADOOP_HOME/bin

# HADOOP
RUN curl -sL --retry 3 \
  "http://archive.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz" \
  | tar zx -C /usr/ \
 && rm -rf $HADOOP_HOME/share/doc

# SPARK
RUN curl -s --retry 3 \
   "http://www-eu.apache.org/dist/spark/spark-${SPARK_VERSION}/${SPARK_PACKAGE}.tgz" \
   | gunzip \
   | tar x -C /usr/ \
   && mv /usr/$SPARK_PACKAGE $SPARK_HOME

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

WORKDIR $SPARK_HOME
CMD ["bin/spark-class", "org.apache.spark.deploy.master.Master"]
