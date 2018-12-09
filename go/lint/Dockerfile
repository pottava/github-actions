FROM supinf/golangci-lint:1.12

RUN apk --no-cache add bash
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
