#!/usr/bin/env bashio

set -ex

CONFIG_PATH=/data/options.json
[ -f $CONFIG_PATH ] && jq -r '.envs[]' $CONFIG_PATH | while IFS='=' read -r key val; do
    echo "$key=$val" >> /tmp/.env
done
if [ -f /tmp/.env ]; then
    export $(cat /tmp/.env | xargs)
fi

exec "$@"