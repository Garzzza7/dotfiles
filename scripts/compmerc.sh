#!/bin/bash
set -e
input=$1
suffix=".m"
if [[ $input == *"$suffix" ]]; then
    input=${input%$suffix}
elif [[ $input == *"." ]]; then
    input=${input%.}
fi
time mmc -E --make $input -O5
time ./$input < $input.txt
