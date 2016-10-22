FROM postgres:9.6

ENV DDL_SCRIPTS_DIR="/ddl-scripts" HIVE_VERSION="2.1.0" HIVE_USER="hive" HIVE_USER_PASSWORD="hive" HIVE_DATABASE_NAME="metastore"

RUN BUILD_DEPS="curl" && \
    apt-get update && apt-get install -y $BUILD_DEPS && \
    curl -L --retry 3 https://www.apache.org/dist/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz \
        | tar -zx -C /tmp && \
    mkdir -p $DDL_SCRIPTS_DIR && \
    SCRIPTS_DIR=/tmp/apache-hive-${HIVE_VERSION}-bin/scripts/metastore/upgrade/postgres && \
    cp $SCRIPTS_DIR/hive-schema-${HIVE_VERSION}.postgres.sql $DDL_SCRIPTS_DIR && \
    cp $SCRIPTS_DIR/hive-txn-schema-${HIVE_VERSION}.postgres.sql $DDL_SCRIPTS_DIR && \
    rm -rf /tmp/* && \  
    apt-get purge -y --auto-remove $BUILD_DEPS && \
    rm -rf /var/lib/apt/lists/*

COPY init-metastore.sh /docker-entrypoint-initdb.d/init-metastore.sh