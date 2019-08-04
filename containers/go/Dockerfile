FROM golang:1.12-alpine3.10

ARG host_group_id
ARG host_user_id

RUN set -x \
    && addgroup -g ${host_group_id} -S go \
    && adduser -u ${host_user_id} -G go -D -S go \
    && mkdir -p "$GOPATH"/pkg/mod \
    && chown -R go:go "$GOPATH" \
    && chmod -R 777 "$GOPATH" \
    && apk update \
    && apk add --no-cache --virtual .buildDeps \
        tzdata \
    && apk add --no-cache --virtual .runtimeDeps \
        ca-certificates \
        openssl \
        git \
    && cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime \
    && echo Europe/Moscow > /etc/timezone \
    #&& go get -u github.com/golang/dep/cmd/dep \ #менеджер зависимостей dep
    #&& go get -u github.com/gomods/athens \ #прокси для модулей
    #&& wget -O /usr/local/bin/dep https://github.com/golang/dep/releases/download/v0.5.4/dep-linux-amd64 \
    #&& chmod +x /usr/local/bin/dep \
    && apk del \
        .buildDeps \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*