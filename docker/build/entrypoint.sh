#!/bin/bash

set -ex

branch=${GITHUB_REF//refs\/heads\//}
tag=${branch//refs\/tags\//}
version=${tag#v}

cd "${BUILD_DIRECTORY}"

exec docker build --file "${DOCKERFILE}" --tag "$(eval echo $1)" ${BUILD_OPTIONS} .
