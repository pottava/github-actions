#!/bin/bash

set -ex

mkdir -p /go/src/github.com/$GITHUB_REPOSITORY
rm -rf /go/src/github.com/$GITHUB_REPOSITORY
ln -s /github/workspace /go/src/github.com/$GITHUB_REPOSITORY
cd $GOPATH/src/github.com/$GITHUB_REPOSITORY/$SRC_DIR

branch=${GITHUB_REF//refs\/heads\//}
version=${branch//refs\/tags\//}
dist="${DST_DIR:-dist/}"

exec gox --osarch "linux/amd64 darwin/amd64 windows/amd64" \
    -ldflags "$(eval echo \"-s -w ${BUILD_OPTIONS}\")" \
    -output "${dist}{{.OS}}_{{.Arch}}"
