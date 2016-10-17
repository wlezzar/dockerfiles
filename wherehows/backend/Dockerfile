FROM wlezzar/java:8

ENV BACKEND_HOME=/opt/backend-service

COPY backend-service ${BACKEND_HOME}
COPY application.conf.tmpl entrypoint.sh /

# Create tmp folders for wherehows
RUN mkdir /var/tmp/wherehows && chmod a+rw /var/tmp/wherehows

# Default configuration
ENV WHZ_BACK_application__langs="en" \
    WHZ_BACK_logger__root="ERROR" \
    WHZ_BACK_logger__play="INFO" \
    WHZ_BACK_logger__application="DEBUG" \
    WHZ_BACK_scheduler__check__interval="10" \
    WHZ_BACK_application__global="shared.Global" \
    WHZ_BACK_db__wherehows__driver="com.mysql.jdbc.Driver" \
    WHZ_BACK_db__wherehows__url="jdbc:mysql://localhost/wherehows?charset=utf8&zeroDateTimeBehavior=convertToNull" \
    WHZ_BACK_db__wherehows__user="wherehows" \
    WHZ_BACK_db__wherehows__password="wherehows" \
    WHZ_BACK_db__wherehows__host="localhost"


ENTRYPOINT ["/entrypoint.sh"]