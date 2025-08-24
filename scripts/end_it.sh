#!/bin/bash

opts="suspend reboot shutdown"
read -r -a arr <<<"$opts"
p=""
res=$(printf "%s\n" "${arr[@]}" | dmenu -c -i -p "$p" -l ${#arr[@]})
#if [ "${res}" = "suspend" ]; then
#	#systemctl halt
#	suspend
#elif
#	[ "${res}" = "reboot" ]
#then
#	systemctl reboot
#elif
#	[ "${res}" = "shutdown" ]
#then
#	systemctl poweroff
#fi

status=$(
		case "$res" in
		("suspend") suspend ;;
		("reboot") reboot ;;
		("shutdown") shutdown ;;
		(*) echo "lol" ;;
		esac)

echo "$status"
