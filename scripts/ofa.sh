#!/bin/bash
prefix="asmf"
name="$prefix$1"
g++ $1.cpp -O2 -masm=intel -fverbose-asm -S -o $name.s
