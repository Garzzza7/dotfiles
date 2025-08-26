#!/bin/bash

i3status -c $HOME/.config/i3status/i3status.conf | while :; do
	read line
	up="$(uptime | awk '{print $3}')"
	echo "Uptime: ${up%?}|$line" || exit 1
done
