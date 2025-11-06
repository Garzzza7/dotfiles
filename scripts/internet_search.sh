#!/bin/bash
set -e
q="$(echo "" | dmenu -c -l 1 -p "" <&-)"
[ -n "${q}" ] && google-chrome https://www.google.com/search?q="${q}"
