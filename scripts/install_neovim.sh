#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install ninja-build gettext cmake unzip curl build-essential

git clone https://github.com/neovim/neovim $HOME/neovim

cd $HOME/neovim/

git checkout stable

make CMAKE_BUILD_TYPE=RelWithDebInfo -j$(nproc)

sudo make install
