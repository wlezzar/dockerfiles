#!/bin/bash
set -e

THIS_DIR=$(readlink -f $(dirname $0))

TAG=$1

if [[ -z "$TAG" ]]; then
    echo "Usage : $0 <tag>"
    exit 1
fi

BURROW_BIN_NAME='burrow'
docker run -it --rm -e BURROW_BIN_NAME="${BURROW_BIN_NAME}" -v $THIS_DIR:/host -w /host golang ./package-burrow.sh

docker build -t wlezzar/burrow:$TAG .
# rm -rf $REPO_NAME