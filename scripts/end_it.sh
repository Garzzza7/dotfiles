#!/bin/bash

opts="suspend reboot shutdown"
read -r -a arr <<<"$opts"
p=""
res=$(printf "%s\n" "${arr[@]}" | dmenu -c -i -p "$p" -l ${#arr[@]})

status=$(
    case "$res" in
    "suspend") suspend ;;
    "reboot") reboot ;;
    "shutdown") shutdown now ;;
    *) echo "lol" ;;
    esac
)

echo "$status"
