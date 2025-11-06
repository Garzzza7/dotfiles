#!/bin/bash

i3status -c $HOME/.config/i3status/i3status.conf | while :; do
	read line
	up="$(uptime | sed -E 's/.* up[[:space:]]+//; s/,.*//')"
	echo "Uptime: ${up}|${line}" || exit 1
done
