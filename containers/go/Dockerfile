FROM golang:1.12-alpine3.10

RUN set -x \
    && apk update \
    && apk add --no-cache --virtual .buildDeps \
        tzdata \
    && apk add --no-cache --virtual .runtimeDeps \
        ca-certificates \
        openssl \
        git \
    && cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime \
    && echo Europe/Moscow > /etc/timezone \
    && wget -O /usr/local/bin/dep https://github.com/golang/dep/releases/download/v0.5.4/dep-linux-amd64 \
    && chmod +x /usr/local/bin/dep \
    && apk del \
        .buildDeps \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*