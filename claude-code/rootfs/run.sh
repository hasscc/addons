#!/usr/bin/env bashio

bashio::log.info "Booting..."

set -ex

CONFIG_PATH=/data/options.json
[ -f $CONFIG_PATH ] && jq -r '.envs[]' $CONFIG_PATH | while IFS='=' read -r key val; do
    echo "$key=$val" >> /tmp/.env
done
if [ -f /tmp/.env ]; then
    set -a
    source /tmp/.env
    set +a
fi

exec "$@"