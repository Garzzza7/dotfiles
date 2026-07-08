#!/bin/bash

set -e

input=$1
suffix=".rs"

if [[ $input == *"$suffix" ]]; then
    input=${input%$suffix}
elif [[ $input == *"." ]]; then
    input=${input%.}
fi

time rustc -O $input.rs -o $input.sol

time ./$input.sol <$input.txt
