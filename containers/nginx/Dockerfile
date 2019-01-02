FROM nginx:1.15-alpine

ARG host_group_id
ARG host_user_id

RUN set -x \
    && addgroup -g ${host_group_id} -S www-data \
    && adduser -u ${host_user_id} -G www-data -D -S www-data \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*
