#!/bin/bash

time g++ -Wall -g --std=c++20 -Wextra -pedantic -O0 -Wconversion -Wfloat-equal -DTIME $1.cpp -o $1.sol

# time clang++ -Wall -g --std=c++20 -Wextra -pedantic -O0 -Wconversion -Wfloat-equal -Wduplicated-cond -Wlogical-op $1.cpp -o $1.sol

time ./$1.sol <$1.txt
# /usr/bin/time -f "%E \n%M kilobytes" ./res.exe < $1.txt
