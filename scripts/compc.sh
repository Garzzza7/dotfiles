#!/bin/bash

set -e

input=$1
suffix=".cpp"

if [[ $input == *"$suffix" ]]; then
    input=${input%$suffix}
elif [[ $input == *"." ]]; then
    input=${input%.}
fi

time g++ -Wall -g --std=c++20 -Wextra -pedantic -O0 -Wconversion -Wfloat-equal -DTIME -DFAST $input.cpp -o $input.sol

# time clang++ -Wall -g --std=c++20 -Wextra -pedantic -O0 -Wconversion -Wfloat-equal -Wduplicated-cond -Wlogical-op $1.cpp -o $1.sol

time ./$input.sol <$input.txt
# /usr/bin/time -f "%E \n%M kilobytes" ./res.exe < $1.txt
