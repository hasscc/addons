#!/usr/bin/env bashio
set -ex

CONFIG_PATH=/data/options.json
PASSWORD=$(jq -r '.password // empty' $CONFIG_PATH)
export PASSWORD

ingress_entry=$(bashio::addon.ingress_entry)
sed -i "s#%%ingress_entry%%#${ingress_entry}#g" /etc/nginx/conf.d/*.conf

/docker-entrypoint.sh "$@"