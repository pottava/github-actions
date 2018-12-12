FROM docker:18.09.0

RUN apk --no-cache add bash

ENV SRC_IMAGE=foo:1.2 \
    DST_IMAGE=bar:2.0

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
