#!/bin/bash
clang++ -S --std=c++20 -emit-llvm $1.cpp -o $1.ll
