#!/usr/bin/env bash

set -euo pipefail

if [ $# -lt 3 ]; then
    echo "Error params format, try: cmd CONTAINER PROJECT COMMAND [OPTIONS]"
    exit 1
fi

container=$1

dir=$(dirname $(readlink -e $0))

export $(cat ${dir}/.env | grep -v ^# | xargs)

project_sub_path=""
dir_names=$(echo $2 | tr "/" "\n")
for dir_name in $dir_names
do
    path_part=$(find "${SOURCE_DIR}${project_sub_path}" -maxdepth 1 -type d -iname "$dir_name" -exec basename {} \;)
    if [ -z "$path_part" ]; then
        path_part=$(find "${SOURCE_DIR}${project_sub_path}" -maxdepth 1 -type d -iname "*$dir_name*" -exec basename {} \;)
        if [ -z "$path_part" ]; then
            if [ -z "$project_sub_path" ]; then
                echo "Project directory not found: ${TARGET_DIR}/${dir_name}"
            else
                echo "Project directory not found: ${TARGET_DIR}${project_sub_path}/${dir_name}"
            fi
            exit 1
        fi
        count=$(echo "$path_part" | wc -l)
        if [ $count -ne 1 ]; then
            if [ -z "$project_sub_path" ]; then
                echo "Project directory not unique: ${TARGET_DIR}/${dir_name}"
            else
                echo "Project directory not unique: ${TARGET_DIR}${project_sub_path}/${dir_name}"
            fi
            exit 1
        fi
    fi
    project_sub_path="$project_sub_path/$path_part"
done

shift
shift

if [ -n "${ECHO_CONTAINER_COMMAND+x}" ] && [ "${ECHO_CONTAINER_COMMAND}" = "true" ]; then
    echo -en "\033[2m>>> \033[31;2m${container}@container\033[0m\033[2m:\033[34;2m${TARGET_DIR}${project_sub_path}\033[0m\033[2m$ $*\033[0m\n"
fi

bash ${dir}/cli ${container} "cd ${TARGET_DIR}${project_sub_path} && $*"