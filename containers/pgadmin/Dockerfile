FROM python:3.7-alpine3.8

ARG host_group_id
ARG host_user_id

ENV PGADMIN_VERSION="1.3"
ENV PGADMIN_HOME="/usr/local/lib/python3.7/site-packages/pgadmin4"
ENV PGADMIN_URL="https://ftp.postgresql.org/pub/pgadmin3/pgadmin4/v${PGADMIN_VERSION}/pip/pgadmin4-${PGADMIN_VERSION}-py2.py3-none-any.whl"

RUN set -x \
    && addgroup -g ${host_group_id} -S pgadmin \
    && adduser -u ${host_user_id} -h /pgadmin -s /sbin/nologin -D -S -G pgadmin pgadmin \
    && apk update \
    && apk add --no-cache --virtual .buildDeps \
        #alpine-sdk \
        gcc \
        postgresql-dev \
        musl-dev \
    && apk add --no-cache --virtual .runtimeDeps \
        #postgresql-dev \
        postgresql-libs \
    && pip install --upgrade pip \
    && pip install --no-cache-dir ${PGADMIN_URL} \
    #&& echo "${PGADMIN_URL}" > requirements.txt \
    #&& pip install --no-cache-dir -r requirements.txt \
    && mkdir -p /pgadmin/config /pgadmin/storage /pgadmin/sessions /pgadmin/queries \
    && chown -R ${host_user_id}:${host_group_id} /pgadmin \
    && cd ${PGADMIN_HOME} \
    && cp config.py config_local.py \
    && sed -i "s/SERVER_MODE = True/SERVER_MODE = False/g" config_local.py \
    && sed -i "s/DEFAULT_SERVER = 'localhost'/DEFAULT_SERVER = '0.0.0.0'/g" config_local.py \
    && apk del \
        .buildDeps \
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/*

WORKDIR ${PGADMIN_HOME}

EXPOSE 5050

VOLUME /pgadmin/

USER pgadmin:pgadmin

CMD [ "python", "pgAdmin4.py" ]