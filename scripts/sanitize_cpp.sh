#!/bin/bash
set -e
input=$1
suffix=".cpp"
if [[ $input == *"$suffix" ]]; then
    input=${input%$suffix}
elif [[ $input == *"." ]]; then
    input=${input%.}
fi
time g++ -Wall -g3 --std=c++20 -Wextra -pedantic -O0 -Wconversion -Wfloat-equal -fsanitize=address -DTIME -DFAST $input.cpp -o $input.sol
time ./$input.sol < $input.txt
