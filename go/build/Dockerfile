FROM supinf/go-gox:1.11

RUN apk --no-cache add bash
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
