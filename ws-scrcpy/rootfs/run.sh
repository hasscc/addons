#!/usr/bin/env bashio

ingress_entry=$(bashio::addon.ingress_entry)

set -ex

sed -i "s#%%ingress_entry%%#${ingress_entry}#g" /etc/nginx/http.d/*.conf
nginx -g "error_log /dev/stdout info;"

if [ ! -d "$ANDROID_HOME" ]; then
    mkdir -p "$ANDROID_HOME"
fi

CONFIG_PATH=/data/options.json
jq -r '.hosts[]' $CONFIG_PATH | while IFS=':' read -r addr port; do
    adb connect $addr:$port
done

exec "$@"