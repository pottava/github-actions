FROM docker:18.09.0

RUN apk --no-cache add bash jq curl && curl --location --silent -o /usr/bin/ecr-creds \
    https://github.com/pottava/ecr-creds/releases/download/v1.0.0/linux_amd64 \
    && apk del --purge -r curl
RUN chmod +x /usr/bin/ecr-creds

ENV DOCKER_USERNAME= \
    DOCKER_PASSWORD= \
    REGISTRY_ENDPOINT= \
    AWS_ACCESS_KEY_ID= \
    AWS_SECRET_ACCESS_KEY= \
    AWS_DEFAULT_REGION=us-east-1

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
