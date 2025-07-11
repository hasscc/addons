#!/usr/bin/env bashio

ingress_entry=$(bashio::addon.ingress_entry)
PASSWORD=$(bashio::config 'password')
if bashio::config.has_value 'resource'; then
    RESOURCE=$(bashio::config 'resource')
fi

set -ex

sed -i "s#%%ingress_entry%%#${ingress_entry}#g" /etc/nginx/http.d/*.conf
nginx -g "error_log /dev/stdout info;"

export PASSWORD
if [ -n "${RESOURCE}" ]; then
    temp=/app/resource.json
    wget -O "$temp" "${RESOURCE}" && mv -fv "$temp" /app/config.json
fi

exec "$@"