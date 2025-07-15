#!/bin/bash

if [ -f "/etc/arch-release" ]; then
	echo "Arch detected!!!!!!"
	sudo pacman -S base-devel cmake ninja curl
elif [ -f "/etc/debian_version" ]; then
	echo "Debian detected!!!!!!"
	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get install ninja-build gettext cmake unzip curl build-essential
fi

git clone https://github.com/neovim/neovim $HOME/neovim

cd $HOME/neovim/

git checkout v0.10.4
# git checkout stable

sudo make CMAKE_BUILD_TYPE=Release -j$(nproc)

sudo make install
