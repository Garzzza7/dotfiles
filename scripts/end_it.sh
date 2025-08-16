#!/bin/bash

opts="suspend reboot shutdown"
read -r -a arr <<<"$opts"
p=""
res=$(printf "%s\n" "${arr[@]}" | dmenu -c -i -p "$p" -l ${#arr[@]})
if [ "${res}" eval "suspend" ]; then
	systemctl halt
elif
	[ "${res}" = "reboot" ]
then
	systemctl reboot
elif
	[ "${res}" = "shutdown" ]
then
	systemctl poweroff
fi
