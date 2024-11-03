FROM golang:1.23.2
ARG TARGETPLATFORM

RUN --mount=type=bind,source=./shared,target=/shared \
    --mount=type=bind,source=./devcontainers/golang,target=/helper \
    /shared/install-packages.sh unzip \
    && /helper/install-binaries.sh $TARGETPLATFORM \
    && go install github.com/go-delve/delve/cmd/dlv@latest \
    && go install google.golang.org/protobuf/cmd/protoc-gen-go@latest \
    && go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
