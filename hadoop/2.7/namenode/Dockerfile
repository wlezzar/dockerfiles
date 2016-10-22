FROM wlezzar/hadoop:2.7

COPY entrypoint.sh /entrypoint.sh

# Create the default namenode data volume
RUN mkdir -p "/data/namenode"
VOLUME ["/data/namenode"]

# default configurations
ENV HDFS_SITE_dfs__namenode__name__dir="file:///data/namenode"

ENTRYPOINT ["/entrypoint.sh"]