#!/bin/bash
rm -rf $HOME/gf
git clone https://github.com/nakst/gf.git    $HOME/gf
cd $HOME/gf
time ./build.sh
