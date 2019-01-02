FROM node:11.6-alpine

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
    && rm -rf /var/cache/apk/* /var/tmp/* /tmp/* \
    && node -v \
    && npm -v \
    && yarn -v
