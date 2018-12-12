#!/bin/bash

set -ex

branch=${GITHUB_REF//refs\/heads\//}
tag=${branch//refs\/tags\//}
version=${tag#v}

for image in $( echo "$1" | tr "," "\n" ); do
  docker push "$(eval echo ${image})"
done
