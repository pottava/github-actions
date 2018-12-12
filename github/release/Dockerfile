FROM alpine:3.8

RUN apk --no-cache add jq curl bash git
RUN curl --location --silent -o ghr.tar.gz \
    https://github.com/tcnksm/ghr/releases/download/v0.12.0/ghr_v0.12.0_linux_amd64.tar.gz
RUN tar xvf ghr.tar.gz && mv ghr_v0.12.0_linux_amd64/ghr /usr/bin/ && chmod +x /usr/bin/ghr

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
