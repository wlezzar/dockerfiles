#!/bin/bash

if [[ -z "$USER_NAME" ]]; then
    echo "Missing USER_NAME. Cannot start the container !"
else
    echo "copying sql workbench configuration files"
    USER_HOME=/home/$USER_NAME
    mkdir -p $USER_HOME/.sqlworkbench && cp /WbDrivers.xml $USER_HOME/.sqlworkbench
    chown -R $USER_NAME:$USER_NAME $USER_HOME
    set -- gosu $USER_NAME $@
    exec "$@"
fi