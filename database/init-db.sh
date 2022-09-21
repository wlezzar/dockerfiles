#!/bin/bash
set -e

DB_USER=${DB_USER:-"joe"}
DB_PASSWORD=${DB_PASSWORD:-"password"}

# Create user
psql --username $POSTGRES_USER -c "CREATE USER $DB_USER WITH CREATEDB PASSWORD '$DB_PASSWORD'"

if [ -d "$DDL_SCRIPTS_DIR" ]; then

    # Adventure works
    if [[ "$ADVENTURE_WORKS" == "true" ]]; then
        echo "Creating Adventure works DB"
        psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER -c "CREATE DATABASE adventure_works WITH OWNER=$DB_USER ENCODING=UTF8;"
        psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER -d adventure_works -c 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";'
        ( cd $DDL_SCRIPTS_DIR/adventure-works && psql -v ON_ERROR_STOP=1 -U $DB_USER -d adventure_works -f install.sql )
    fi

    # World DB
    if [[ "$WORLD_DB" == "true" ]]; then
        echo "Creating World DB"
        psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER -c "CREATE DATABASE world WITH OWNER=$DB_USER ENCODING=UTF8;"
        psql -v ON_ERROR_STOP=1 -U $DB_USER -d world -f $DDL_SCRIPTS_DIR/world/world.sql
    fi

    # Dellstore DB
    if [[ "$DELLSTORE" == "true" ]]; then
        echo "Creating dellstore DB"
        psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER -c "CREATE DATABASE dellstore WITH OWNER=$DB_USER ENCODING=UTF8;"
        psql -v ON_ERROR_STOP=1 -U $DB_USER -d dellstore -f $DDL_SCRIPTS_DIR/dell-store/dellstore2-normal-1.0.sql
    fi

    # USDA
    if [[ "$USDA" == "true" ]]; then
        echo "Creating USDA DB"
        psql -v ON_ERROR_STOP=1 --username $POSTGRES_USER -c "CREATE DATABASE usda WITH OWNER=$DB_USER ENCODING=UTF8;"
        psql -v ON_ERROR_STOP=1 -U $DB_USER -d usda -f $DDL_SCRIPTS_DIR/usda/usda.sql
    fi
    
else
    echo "DDL_SCRIPTS_DIR ($DDL_SCRIPTS_DIR) is not a directory"
    exit 1
fi