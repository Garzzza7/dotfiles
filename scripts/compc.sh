#!/bin/bash
g++ -Wall -g --std=c++20 -Wextra -pedantic -O0 $1.cpp -o res
time ./res < $1.txt
rm res