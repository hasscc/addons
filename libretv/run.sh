#!/bin/sh
set -e

CONFIG_PATH=/data/options.json
PASSWORD=$(jq -r '.password // empty' $CONFIG_PATH)
export PASSWORD

/docker-entrypoint.sh "$@"