FROM wlezzar/java:8

ENV HADOOP_VERSION=2.7.3 HADOOP_HOME=/usr/hadoop

# Install Hadoop
RUN curl -L --retry 3 \
        https://www.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz \
        | tar -zx -C /tmp && \
    mv /tmp/hadoop* $HADOOP_HOME

ENV PATH=$PATH:$HADOOP_HOME/bin \
    HADOOP_PREFIX=$HADOOP_HOME \
    HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop

# Copy templates and configuration script
COPY templates /templates
COPY configure-hadoop.sh /

ENTRYPOINT ["/configure-hadoop.sh"]