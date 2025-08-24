#!/bin/bash

set -e

res=""
res="$(ps -e | sort -k 4 -u | awk '{print $4}' | dmenu -c -i -p "$p" -l 40)"
if [ "$res" != "" ]; then
	killall "$res"
fi
