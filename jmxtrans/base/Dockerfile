FROM wlezzar/java:8

ENV DEBIAN_FRONTEND=noninteractive 

# Install JMX trans
ENV JMXTRANS_VERSION=263
RUN wget http://central.maven.org/maven2/org/jmxtrans/jmxtrans/$JMXTRANS_VERSION/jmxtrans-$JMXTRANS_VERSION.deb -O jmxtrans.deb && \
    dpkg -i jmxtrans.deb && \
    rm jmxtrans.deb

COPY run-jmxtrans.sh log4j-configuration.xml /

# Default configuration
ENV SECONDS_BETWEEN_RUNS="60" \
    JSON_DIR="/var/lib/jmxtrans" \
    JAVA_OPTS="-Djava.awt.headless=true -Djava.net.preferIPv4Stack=true" \
    HEAP_SIZE="512" \
    PERM_SIZE="384" \
    MAX_PERM_SIZE="384" \
    JMX_PORT="9990" \
    LOG_LEVEL="info" \
    CONTINUE_ON_ERROR="false" \
    LOG4J_CONFIGURATION_FILE="/log4j-configuration.xml"

CMD ["/run-jmxtrans.sh"]