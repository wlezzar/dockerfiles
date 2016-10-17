FROM wlezzar/java:8

ENV WHEREHOWS_HOME=/opt/wherehows

COPY wherehows ${WHEREHOWS_HOME}
COPY application.conf.tmpl entrypoint.sh /

# Create tmp folders for wherehows
RUN mkdir /var/tmp/wherehows && chmod a+rw /var/tmp/wherehows

# Default configuration
ENV WHZ_FRONT_application__secret="`h2af<Nx<TaSfF82tv8Woeo52_l72iODF>G72cnrHDNmlRRpqyD_YgYb<aCea^9o" \
    WHZ_FRONT_application__langs="en" \
    WHZ_FRONT_logger__root="ERROR" \
    WHZ_FRONT_logger__play="INFO" \
    WHZ_FRONT_logger__application="DEBUG" \
    WHZ_FRONT_datasets__tree__name="/var/tmp/wherehows/resource/dataset.json" \
    WHZ_FRONT_flows__tree__name="/var/tmp/wherehows/resource/flow.json" \
    WHZ_FRONT_database__opensource__username="wherehows" \
    WHZ_FRONT_database__opensource__password="wherehows" \
    WHZ_FRONT_database__opensource__url="jdbc:mysql://localhost/wherehows?charset=utf8&zeroDateTimeBehavior=convertToNull" \
    WHZ_FRONT_search__engine="default" \
    WHZ_FRONT_backend__service__url="http://localhost:9001" \
    WHZ_FRONT_dataset__hdfs_browser__link="https://localhost:8888/filebrowser/#" \
    WHZ_FRONT_lineage__look__back__time="60"

ENTRYPOINT ["/entrypoint.sh"]