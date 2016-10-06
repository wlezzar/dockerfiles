#!/bin/bash
set -e

echo "Packaging burrow..."

# Install gpm
curl -sSO https://raw.githubusercontent.com/pote/gpm/v1.4.0/bin/gpm
chmod +x gpm
mv gpm /usr/local/bin

# Package burrow
go get github.com/linkedin/Burrow
cd $GOPATH/src/github.com/linkedin/Burrow
gpm install
go install
cp $GOPATH/bin/Burrow /host/${BURROW_BIN_NAME}