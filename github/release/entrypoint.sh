#!/bin/bash

branch=${GITHUB_REF//refs\/heads\//}
version=${branch//refs\/tags\//}
dist="${ARTIFACT_DIR:-dist/}"

exec ghr -t "${GITHUB_TOKEN}" -u "${GITHUB_ACTOR}" \
    -r "$(cat "${GITHUB_EVENT_PATH}" | jq -r '.repository.name')" \
    --replace "${version}" "${dist}"
