FROM php:7.3-cli-alpine3.9

ARG host_group_id
ARG host_user_id

RUN set -x \
    && OLD_UID=$(id -u www-data) \
    && OLD_GID=$(id -g www-data) \
    && deluser www-data \
    && addgroup -g ${host_group_id} -S www-data \
    && adduser -u ${host_user_id} -G www-data -D -S www-data \
    && find / -user ${OLD_UID} -exec chown www-data {} \; \
    && find / -group ${OLD_GID} -exec chgrp www-data {} \; \
    && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && apk update \
    && apk add --no-cache --virtual .buildDeps \
        autoconf \
        g++ \
        gcc \
        libc-dev \
        make \
        re2c \
        tzdata \
    && apk add --no-cache --virtual .buildDeps-postgres \
        postgresql-dev \
    && apk add --no-cache --virtual .buildDeps-intl \
        icu-dev \
    && apk add --no-cache --virtual .buildDeps-gd \
        freetype-dev \
        libjpeg-turbo-dev \
        libpng-dev \
        libwebp-dev \
    && apk add --no-cache --virtual .buildDeps-zip \
        libzip-dev \
    && apk add --no-cache --virtual .buildDeps-soap \
        libxml2-dev \
    && apk add --no-cache --virtual .buildDeps-gmagick \
        graphicsmagick-dev \
#    && apk add --no-cache --virtual .buildDeps-imagick \
#        imagemagick-dev \
    && apk add --no-cache --virtual .buildDeps-memcached \
        libmemcached-dev \
    && apk add --no-cache --virtual .buildDeps-rdkafka \
        librdkafka-dev \
#    && apk add --no-cache --virtual .buildDeps-pthreads \ #zts required
#        pcre-dev \
    && apk add --no-cache --virtual .runtimeDeps \
        supervisor \
        jpegoptim \
        pngquant \
        optipng \
    && apk add --no-cache --virtual .runtimeDeps-postgres \
        postgresql \
    && apk add --no-cache --virtual .runtimeDeps-intl \
        icu-libs \
    && apk add --no-cache --virtual .runtimeDeps-gd \
        freetype \
        libjpeg-turbo \
        libpng \
        libwebp \
    && apk add --no-cache --virtual .runtimeDeps-zip \
        libzip \
    && apk add --no-cache --virtual .runtimeDeps-gmagick \
        libtool \
        libgomp \
        graphicsmagick \
#    && apk add --no-cache --virtual .runtimeDeps-imagick \
#        imagemagick \
    && apk add --no-cache --virtual .runtimeDeps-memcached \
        libmemcached-libs \
    && apk add --no-cache --virtual .runtimeDeps-rdkafka \
        librdkafka \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ --with-webp-dir=/usr/include/ \
    && docker-php-ext-install -j${NPROC} pgsql pdo_pgsql pdo_mysql mysqli intl opcache pcntl gd exif zip soap \
    && pecl config-set php_ini /usr/local/etc/php/php.ini \
    && pear config-set php_ini /usr/local/etc/php/php.ini \
    && pecl install gmagick-beta \
#    && pecl install imagick \
    && pecl install memcached \
    && pecl install rdkafka \
    && pecl install redis \
    && pecl install xdebug \
#    && cd / \
#    && git clone https://github.com/krakjoe/pthreads.git \
#    && cd pthreads \
#    && phpize \
#    && ./configure --enable-pthreads \
#    && make -j${NPROC} \
#    && make install \
#    && cd / \
#    && rm -rf pthreads \
    && docker-php-ext-enable gmagick \
#    && docker-php-ext-enable imagick \
    && docker-php-ext-enable memcached \
    && docker-php-ext-enable rdkafka \
    && docker-php-ext-enable redis \
    && docker-php-ext-enable xdebug \
#    && docker-php-ext-enable pthreads \
    && cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime \
    && echo Europe/Moscow > /etc/timezone \
    && apk del \
        .buildDeps \
        .buildDeps-postgres \
        .buildDeps-intl \
        .buildDeps-gd \
        .buildDeps-zip \
        .buildDeps-soap \
        .buildDeps-gmagick \
#        .buildDeps-imagick \
        .buildDeps-memcached \
        .buildDeps-rdkafka \
#        .buildDeps-pthreads \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/* \
    && php -v \
    && php -m
