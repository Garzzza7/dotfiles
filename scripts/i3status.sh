#!/bin/bash

i3status -c $HOME/.config/i3status/i3status.conf | while :; do
    read line
    layout="$(xkbcli dump-keymap | grep xkb_symbols | awk -F'_' '{print $3}')"
    up="$(uptime | sed -E 's/.* up[[:space:]]+//; s/,.*//')"
    echo "Layout: ${layout} | Uptime: ${up} | ${line}" || exit 1
done
