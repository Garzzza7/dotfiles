#!/bin/bash

input="$1"
output="${input::-4}"

echo "$output"

time g++ -Wall -g --std=c++20 -Wextra -pedantic -O0 -Wconversion -Wfloat-equal $output.cpp -o $output.sol

# time clang++ -Wall -g --std=c++20 -Wextra -pedantic -O0 -Wconversion -Wfloat-equal -Wduplicated-cond -Wlogical-op $input -o $output.sol

time ./$output.sol < $output.txt
