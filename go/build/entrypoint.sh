#!/bin/bash

set -ex

mkdir -p /go/src/github.com/$GITHUB_REPOSITORY
rm -rf /go/src/github.com/$GITHUB_REPOSITORY
ln -s /github/workspace /go/src/github.com/$GITHUB_REPOSITORY
cd $GOPATH/src/github.com/$GITHUB_REPOSITORY/$SRC_DIR

branch=${GITHUB_REF//refs\/heads\//}
tag=${branch//refs\/tags\//}
version="${tag}-${GITHUB_SHA:0:7}"

gox --osarch "linux/amd64 darwin/amd64 windows/amd64" \
    -ldflags "-s -w -X main.version=${version} -X main.date=$(date '+%Y-%m-%d')" \
    -output "dist/{{.OS}}_{{.Arch}}"
ret=$?

if [ "${POST_PROCESS}" == "github_release" ]; then
    apk --no-cache add curl jq && curl --location --silent -o ghr.tar.gz \
        https://github.com/tcnksm/ghr/releases/download/v0.12.0/ghr_v0.12.0_linux_amd64.tar.gz
    tar xvf ghr.tar.gz && mv ghr_v0.12.0_linux_amd64/ghr /usr/bin/ && chmod +x /usr/bin/ghr
    ghr -t "${GITHUB_TOKEN}" -u "${GITHUB_ACTOR}" \
        -r "$(cat "${GITHUB_EVENT_PATH}" | jq -r '.repository.name')" \
        --replace "${tag}" dist/
    ret=$?
fi

exit $ret
