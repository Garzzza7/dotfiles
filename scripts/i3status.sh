#!/bin/bash

i3status -c $HOME/.config/i3status/i3status.conf | while :; do
	read line
	echo "idk|$line" || exit 1
done
