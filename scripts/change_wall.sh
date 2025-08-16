#!/bin/bash
p=""
res=$(ls $HOME/.config/i3 | grep -v "config" | dmenu -c -i -p "$p" -l 10)
if [ "$res" = "" ]; then
	feh --bg-max $HOME/.config/i3/mitsuri.png
else
	feh --bg-max $HOME/.config/i3/"${res}"
fi
