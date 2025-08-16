#!/bin/bash

opts="suspend reboot shutdown"
read -r -a arr <<<"$opts"
p=""
printf "%s\n" "${arr[@]}" | dmenu -c -i -p "$p" -l ${#arr[@]}

case "${p}" in
"suspend")
	suspend
	;;
"reboot")
	reboot
	;;
"shutdown")
	shutdown
	;;
*)
	echo "unreachable"
	;;
esac
