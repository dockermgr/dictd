#!/usr/bin/env bash

case "$1" in
--health)
  if ps aux | grep -v grep | grep -q "[d]ict"; then
    exit 0
  else
    exit 1
  fi
  ;;
esac

[[ -f "/config/dict.conf" ]] &&
  cp -Rf "/config/dict.conf" "/etc/dictd/dict.conf" ||
  cp -Rf "/etc/dictd/dict.conf" "/config/dict.conf"
[[ -f "/config/dictd.conf" ]] &&
  cp -Rf "/config/dictd.conf" "/etc/dictd/dictd.conf" ||
  cp -Rf "/etc/dictd/dictd.conf" "/config/dictd.conf"

dictd -dnodetach
