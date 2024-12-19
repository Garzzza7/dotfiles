#!/bin/bash

set -ex

rm -rf $HOME/gf
git clone --depth 1 https://github.com/nakst/gf.git $HOME/gf
cd $HOME/gf
time ./build.sh
