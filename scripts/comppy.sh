#!/bin/bash

set -ex

time python3 $1.py < $1.txt
