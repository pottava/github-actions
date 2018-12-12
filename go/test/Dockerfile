FROM golang:1.11.2-alpine3.8

RUN apk --no-cache add bash g++
ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
