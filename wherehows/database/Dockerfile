
FROM mysql:5.6

ENV WHEREHOWS_BRANCH=master \
    DDL_SCRIPTS_DIR="/scripts"

# Getting DDL scripts from Wherehows repo
RUN BUILD_DEPS="git" && \
    echo "Copying DDL scripts " && \
    apt-get update && \
    apt-get install -y $BUILD_DEPS && \
    git clone https://github.com/linkedin/WhereHows.git /tmp/wherehows && \
    git --git-dir=/tmp/wherehows/.git --work-tree=/tmp/wherehows checkout $WHEREHOWS_BRANCH && \
    cp -R /tmp/wherehows/data-model/DDL $DDL_SCRIPTS_DIR && \
    echo "Cleaning..." && \
    rm -rf /tmp/wherehows && \
    apt-get purge --auto-remove -y $BUILD_DEPS && \
    rm -rf /var/lib/apt/lists/*

# Default configuration
ENV WHEREHOWS_DB_USER="wherehows" \
    WHEREHOWS_DB_USER_PASSWORD="wherehows" \
    WHEREHOWS_DB_RO_USER="wherehows_ro" \
    WHEREHOWS_DB_RO_USER_PASSWORD="wherehows_ro" \
    WHEREHOWS_DB_NAME="wherehows"

COPY init-wherehows-db.sh /docker-entrypoint-initdb.d/init-wherehows-db.sh