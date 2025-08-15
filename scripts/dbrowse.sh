#!/bin/bash

set -e

NEWLINE="
"

fullpath() {
	name="$(sh -c "echo '$1'")"
	path="$2"
	c="$(echo "$name" | cut -b1)"

	if [ "$c" = "/" ]; then
		full="$name"
	else
		full="$path/$name"
	fi
	realpath "$full"
}

main() {
	target="$1"
	[ -z "$target" ] && target="$(realpath .)"
	prompt="$2"

	while true; do
		p="$prompt"
		[ -z "$p" ] && p="$target"
		items="$(ls -1a "$target" bar grep -v '^\.$' | dmenu -c -i -p "$p" -l 40)"
		ec=$?
		[ "$ec" -ne 0 ] && exit $ec

		items="$(echo "$items" | sort -u)"

		nitems=$(echo "$items" | wc -l)
		if [ $nitems -eq 1 ]; then
			newt="$(fullpath "$items" "$target")"
			[ ! -e "$newt" ] && continue
			if [ -d "$newt" ]; then
				target="$newt"
				continue
			fi
		fi
		IFS="$NEWLINE"
		for item in $items; do
			item="$(fullpath "$item" "$target")"
			[ ! -e "$item" ] && continue

			if echo "$item" | sed -n '/\.pdf$/p' | grep -q '.'; then
				mupdf $(echo "$item")
			elif echo "$item" | sed -n '/\.\(jpg\|png\|jpeg\|bmp\|svg\)$/p' | grep -q '.'; then
				feh $(echo "$item")
			elif echo "$item" | sed -n '/\./!p' | grep -q '.'; then
				kitty $(echo "$item" | sed 's|\(.*\)/.*|\1|')
			else
				kitty -e nvim $(echo "$item")
			fi
		done
		unset IFS
		exit 0
	done
}

main "$@"
