#!/usr/bin/env bash

set -euo pipefail

if [ $# -lt 1 ]; then
    echo "Error params format, try: go PROJECT [COMMAND] [OPTIONS]"
    exit 1
fi

project=$1

shift

dir=$(dirname $(readlink -e $0))

bash ${dir}/go-cli $project "go $*"