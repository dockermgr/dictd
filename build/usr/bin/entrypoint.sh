#!/usr/bin/env bash

[[ -f "/config/dict.conf" ]] &&
  cp -Rf "/config/dict.conf" "/etc/dictd/dict.conf" ||
  cp -Rf "/etc/dictd/dict.conf" "/config/dict.conf"
[[ -f "/config/dictd.conf" ]] &&
  cp -Rf "/config/dictd.conf" "/etc/dictd/dictd.conf" ||
  cp -Rf "/etc/dictd/dictd.conf" "/config/dictd.conf"

dictd -dnodetach
