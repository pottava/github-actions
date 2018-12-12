#!/bin/bash

set -ex

config=${GOLANGCI_LINT_CONFIG:-.golangci.yml}

mkdir -p /go/src/github.com/$GITHUB_REPOSITORY
rm -rf /go/src/github.com/$GITHUB_REPOSITORY
ln -s /github/workspace /go/src/github.com/$GITHUB_REPOSITORY
cd $GOPATH/src/github.com/$GITHUB_REPOSITORY/$SRC_DIR

exec golangci-lint run --config "${config}"
