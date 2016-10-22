#!/bin/bash
set -e

if [ -d "$DDL_SCRIPTS_DIR" ]; then
    # Create database
    psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER <<-EOSQL
            CREATE USER $HIVE_USER WITH CREATEDB PASSWORD '$HIVE_USER_PASSWORD';
            CREATE DATABASE $HIVE_DATABASE_NAME WITH OWNER=$HIVE_USER ENCODING=UTF8;
EOSQL
    
    cd $DDL_SCRIPTS_DIR

    psql -v ON_ERROR_STOP=1 -U $HIVE_USER -f $DDL_SCRIPTS_DIR/hive-schema-${HIVE_VERSION}.postgres.sql $HIVE_DATABASE_NAME
    
else
    echo "DDL_SCRIPTS_DIR ($DDL_SCRIPTS_DIR) is not a directory"
    exit 1
fi