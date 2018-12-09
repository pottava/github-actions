#!/bin/bash

set -e

mkdir -p /go/src/$GITHUB_REPOSITORY
ln -s /github/workspace /go/src/github.com/$GITHUB_REPOSITORY
cd $GOPATH/src/github.com/$GITHUB_REPOSITORY

exec dep ensure
