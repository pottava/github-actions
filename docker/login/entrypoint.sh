#!/bin/bash

set -ex

if [ "${AWS_ACCESS_KEY_ID}" != "" ]; then
  creds=$( ecr-creds get )
  DOCKER_USERNAME=AWS
  DOCKER_PASSWORD=$( echo "${creds}" | jq -r '.password' )
  REGISTRY_ENDPOINT=$( echo "${creds}" | jq -r '.endpoint' )
fi

exec docker login \
    --username "${DOCKER_USERNAME}" \
    --password "${DOCKER_PASSWORD}" \
    "${REGISTRY_ENDPOINT}"
