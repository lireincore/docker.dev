FROM nginx:1.17-alpine

ARG host_group_id
ARG host_user_id

RUN set -x \
    && OLD_GID=$(getent group www-data | cut -d: -f3) \
    && delgroup www-data \
    && addgroup -g ${host_group_id} -S www-data \
    && adduser -u ${host_user_id} -G www-data -D -S www-data \
    && find / -group ${OLD_GID} -exec chgrp www-data {} \; \
    && apk update \
    && apk add --no-cache --virtual .buildDeps \
        tzdata \
    && cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime \
    && echo Europe/Moscow > /etc/timezone \
    && apk del \
        .buildDeps \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*
