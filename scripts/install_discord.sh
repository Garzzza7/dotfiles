#!/bin/bash

if [ -f "/etc/arch-release" ]; then
    echo "Arch detected!!!!!!"
    sudo pacman -S discord
elif [ -f "/etc/debian-version" ]; then
    echo "Debian detected!!!!!!"
    rm discord.deb
    set -ex
    wget "https://discord.com/api/download?platform=linux&format=deb" -O discord.deb
    sudo apt install ./discord.deb
    rm discord.deb
fi
