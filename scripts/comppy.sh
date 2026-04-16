#!/bin/bash

set -e

input=$1
suffix=".py"

if [[ $input == *"$suffix" ]]; then
	input=${input%$suffix}
elif [[ $input == *"." ]]; then
	input=${input%.}
fi

time pypy3 $input.py <$input.txt
