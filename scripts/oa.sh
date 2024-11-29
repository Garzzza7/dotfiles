#!/bin/bash
g++ $1.cpp -O0 -masm=intel -fverbose-asm -S -o $1.s
