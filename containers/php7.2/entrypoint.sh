#!/usr/bin/env sh

#DOCKERHOST=$(ip -4 route list match 0/0 | awk '{print $3}');

#export XDEBUG_CONFIG="remote_enable=1 remote_autostart=1 remote_mode=req remote_port=9001 remote_host=${DOCKERHOST} remote_connect_back=0"

docker-php-entrypoint "$@"