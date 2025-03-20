#!/bin/bash

if [ -f "/etc/arch-release" ]; then
    echo "Arch detected!!!!!!"
    sudo pacman -S cuda opencl-nvidia
elif [ -f "/etc/debian_version" ]; then
    echo "Debian detected!!!!!!"
    sudo apt-key del 7fa2af80
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2404/x86_64/cuda-keyring_1.1-1_all.deb
    sudo dpkg -i cuda-keyring_1.1-1_all.deb
    rm cuda-keyring_1.1-1_all.deb
    sudo apt-get install cuda-toolkit
    sudo apt-get install nvidia-gds
fi
