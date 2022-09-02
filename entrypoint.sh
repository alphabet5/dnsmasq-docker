#!/bin/bash

# allow arguments to be passed to dnsmasq
if [[ ${1:0:1} = '-' ]]; then
  EXTRA_ARGS="$@"
  set --
elif [[ ${1} == dnsmasq || ${1} == $(which dnsmasq) ]]; then
  EXTRA_ARGS="${@:2}"
  set --
fi

# default behaviour is to launch dnsmasq
if [[ -z ${1} ]]; then
  echo "Starting dnsmasq..."
  exec $(which dnsmasq) --conf-file=- --listen-address=* --log-facility=- --keep-in-foreground --no-resolv --no-hosts --strict-order ${EXTRA_ARGS}
else
  exec "$@"
fi
