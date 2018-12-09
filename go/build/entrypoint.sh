#!/bin/bash

set -e

mkdir -p /go/src/$GITHUB_REPOSITORY
ln -s /github/workspace /go/src/github.com/$GITHUB_REPOSITORY
cd $GOPATH/src/github.com/$GITHUB_REPOSITORY

exec gox --osarch "linux/amd64 darwin/amd64 windows/amd64" -ldflags "-s -w" -output "dist/{{.OS}}_{{.Arch}}"
