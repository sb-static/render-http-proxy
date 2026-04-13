#!/bin/sh
set -eu

: "${PORT:?missing PORT}"
: "${PROXY_USER:?missing PROXY_USER}"
: "${PROXY_PASSWORD:?missing PROXY_PASSWORD}"

envsubst '${PORT} ${PROXY_USER} ${PROXY_PASSWORD}' \
  < /app/tinyproxy.conf.template \
  > /etc/tinyproxy/tinyproxy.conf

exec tinyproxy -d -c /etc/tinyproxy/tinyproxy.conf
