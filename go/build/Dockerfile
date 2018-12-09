FROM pottava/gox:go1.11

RUN apk --no-cache add bash
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
