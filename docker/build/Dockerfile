FROM docker:18.09.0

RUN apk --no-cache add bash

ENV BUILD_DIRECTORY="." \
    DOCKERFILE="Dockerfile"

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
