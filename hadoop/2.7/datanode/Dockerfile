FROM wlezzar/hadoop:2.7

COPY entrypoint.sh /entrypoint.sh

# Create the default namenode data volume
RUN mkdir -p "/data/datanode"
VOLUME ["/data/datanode"]

# default configurations
ENV HDFS_SITE_dfs__datanode__data__dir="file:///data/datanode"

ENTRYPOINT ["/entrypoint.sh"]