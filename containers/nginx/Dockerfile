FROM nginx:1.16-alpine

ARG host_group_id
ARG host_user_id

RUN set -x \
    && addgroup -g ${host_group_id} -S www-data \
    && adduser -u ${host_user_id} -G www-data -D -S www-data \
    && apk update \
    && apk add --no-cache --virtual .buildDeps \
        tzdata \
    && cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime \
    && echo Europe/Moscow > /etc/timezone \
    && apk del \
        .buildDeps \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*
