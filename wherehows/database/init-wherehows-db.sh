#!/bin/bash
set -e

if [ -d "$DDL_SCRIPTS_DIR" ]; then

    mysql=( mysql --protocol=socket -uroot )
    if [ ! -z "$MYSQL_ROOT_PASSWORD" ]; then
		mysql+=( -p"${MYSQL_ROOT_PASSWORD}" )
	fi

    # Create DMP database
    "${mysql[@]}" <<-EOSQL
            CREATE DATABASE $WHEREHOWS_DB_NAME
                DEFAULT CHARACTER SET utf8
                DEFAULT COLLATE utf8_general_ci;

            CREATE USER '$WHEREHOWS_DB_USER'@'localhost' IDENTIFIED BY '$WHEREHOWS_DB_USER_PASSWORD';
            CREATE USER '$WHEREHOWS_DB_USER'@'%' IDENTIFIED BY '$WHEREHOWS_DB_USER_PASSWORD';
            GRANT ALL ON $WHEREHOWS_DB_NAME.* TO '$WHEREHOWS_DB_USER'@'localhost';
            GRANT ALL ON $WHEREHOWS_DB_NAME.* TO '$WHEREHOWS_DB_USER'@'%';

            CREATE USER '$WHEREHOWS_DB_RO_USER'@'localhost' IDENTIFIED BY '$WHEREHOWS_DB_RO_USER_PASSWORD';
            CREATE USER '$WHEREHOWS_DB_RO_USER'@'%' IDENTIFIED BY '$WHEREHOWS_DB_RO_USER_PASSWORD';
            GRANT SELECT ON $WHEREHOWS_DB_NAME.* TO '$WHEREHOWS_DB_RO_USER'@'localhost';
            GRANT SELECT ON $WHEREHOWS_DB_NAME.* TO '$WHEREHOWS_DB_RO_USER'@'%';
EOSQL

    mysql+=( "$WHEREHOWS_DB_NAME" )

    cd $DDL_SCRIPTS_DIR
    "${mysql[@]}" < "create_all_tables_wrapper.sql"

else
    echo "DDL_SCRIPTS_DIR ($DDL_SCRIPTS_DIR) is not a directory"
    exit 1
fi