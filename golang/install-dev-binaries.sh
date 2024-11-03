#!/bin/bash
set -euo pipefail

if [ -z "$1" ]; then
  echo "Usage: $0 <target-platform>"
  exit 1
fi

if [ "$TARGETPLATFORM" = "linux/amd64" ]; then PROTOC_ARCH=x86_64;\
elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then PROTOC_ARCH=aarch_64; \
else PROTOC_ARCH=amd64; \
fi 

ARCHITECTURE=$1

# Install protoc
PROTOC_VERSION=28.3
PROTOC_FILENAME=protoc-$PROTOC_VERSION-linux-$PROTOC_ARCH.zip

curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VERSION/$PROTOC_FILENAME \
    && unzip $PROTOC_FILENAME -d /usr/local \
    && rm $PROTOC_FILENAME

# Install golangci-lint binary
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | \
    sh -s -- -b $(go env GOPATH)/bin v1.61.0