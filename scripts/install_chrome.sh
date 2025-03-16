#!/bin/bash


if [ -f "/etc/arch-release" ]; then
    echo "Arch detected!!!!!!"
elif [ -f "/etc/debian-version" ]; then
    echo "Debian detected!!!!!!"
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt --fix-broken install
    rm google-chrome-stable_current_amd64.deb
fi
