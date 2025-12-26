#!/usr/bin/env bash

set -ex

CONFIG_PATH=/data/options.json
[ -f $CONFIG_PATH ] && jq -r '.envs[]' $CONFIG_PATH | while IFS='=' read -r key val; do
    echo "$key=$val" >> .env
done
if [ -f .env ]; then
    export $(cat .env | xargs)
fi

exec "$@"