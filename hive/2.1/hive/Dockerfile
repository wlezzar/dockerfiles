FROM wlezzar/hadoop:2.7

ENV HIVE_VERSION="2.1.0" HIVE_HOME="/usr/hive"

# Install hive
RUN curl -L --retry 3 https://www.apache.org/dist/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz \
        | tar -zx -C /tmp && \
    mv /tmp/apache-hive-${HIVE_VERSION}-bin $HIVE_HOME && \
    wget https://jdbc.postgresql.org/download/postgresql-9.4.1209.jre7.jar -O $HIVE_HOME/lib/postgresql-jdbc.jar

COPY hive-site.xml /hive-site.xml

# Default configuration
ENV PATH="$PATH:$HIVE_HOME/bin" \
    HIVE_SITE_javax__jdo__option__ConnectionURL="jdbc:postgresql://localhost:5432/metastore" \
    HIVE_SITE_javax__jdo__option__ConnectionDriverName="org.postgresql.Driver" \
    HIVE_SITE_javax__jdo__option__ConnectionUserName="hive" \
    HIVE_SITE_javax__jdo__option__ConnectionPassword="hive" \
    HIVE_SITE_datanucleus__autoCreateSchema=false \
    HIVE_SITE_datanucleus__fixedDatastore=true \
    HIVE_SITE_hive__metastore__uris=thrift://localhost:9083

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
