FROM node:13.10-alpine3.11

ARG host_group_id
ARG host_user_id

RUN set -x \
    && OLD_UID=$(id -u node) \
    && OLD_GID=$(id -g node) \
    && deluser node \
    && addgroup -g ${host_group_id} -S node \
    && adduser -u ${host_user_id} -G node -D -S node \
    && find / -user ${OLD_UID} -exec chown node {} \; \
    && find / -group ${OLD_GID} -exec chgrp node {} \; \
    && mkdir /home/node/.yarn \
    && mkdir /home/node/.npm \
    && chown node:node /home/node/.yarn \
    && chown node:node /home/node/.npm \
    && apk update \
    && apk add --no-cache --virtual .buildDeps \
        tzdata \
    && apk add --no-cache --virtual .runtimeDeps \
#        npm \
        pkgconfig \
        autoconf \
        automake \
        libtool \
        nasm \
        build-base \
        zlib-dev \
#        git \
#        alpine-sdk  \
#        zlib \
#        zlib-dev \
#        libpng \
#        libpng-dev\
#        libwebp \
#        libwebp-dev \
#        libjpeg-turbo \
#        libjpeg-turbo-dev \
#        lcms2-dev \
#        bash \
#        gcc \
#        g++ \
#    && npm install -g npm \
#    && npm install -g imagemin \
#    && npm install -g gulp-imagemin \
#    && npm install -g optipng-bin \
    && cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime \
    && echo Europe/Moscow > /etc/timezone \
    && apk del \
        .buildDeps \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/* \
    && node -v \
    && npm -v \
    && yarn -v