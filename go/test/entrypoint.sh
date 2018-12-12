#!/bin/bash

set -ex

mkdir -p /go/src/github.com/$GITHUB_REPOSITORY
rm -rf /go/src/github.com/$GITHUB_REPOSITORY
ln -s /github/workspace /go/src/github.com/$GITHUB_REPOSITORY
cd $GOPATH/src/github.com/$GITHUB_REPOSITORY/$SRC_DIR

if [ "${IGNORE_DIR}" != "" ]; then
  exec go test -cover -bench -benchmem -vet off $(go list ./... | grep -v "${IGNORE_DIR}")
else
  exec go test -cover -bench -benchmem -vet off $(go list ./...)
fi
