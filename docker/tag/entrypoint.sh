#!/bin/bash

set -ex

branch=${GITHUB_REF//refs\/heads\//}
tag=${branch//refs\/tags\//}
version=${tag#v}

exec docker tag "$(eval echo ${SRC_IMAGE})" "$(eval echo ${DST_IMAGE})"
