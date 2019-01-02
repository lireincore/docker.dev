#!/usr/bin/env bash

set -euo pipefail

if [ $# -lt 2 ]; then
    echo "Error params format, try: cmd CONTAINER COMMAND [OPTIONS]"
    exit 1
fi

dir=$(dirname $(readlink -e $0))

export $(cat ${dir}/.env | grep -v ^# | xargs)

container="${COMPOSE_PROJECT_NAME}_$1"
check=$(docker ps | awk '{print $NF}' | grep -x "$container")
if [ -z "$check" ]; then
    echo "Container $container not found"
    exit 1
fi

shift

docker exec -it $container sh -c "$*"