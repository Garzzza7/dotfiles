#!/bin/bash

if [ -f "/etc/arch-release" ]; then
    echo "Arch detected!!!!!!"
    sudo pacman -S base-devel cmake ninja curl feh neofetch discord unzip luarocks ripgrep npm lazygit github-cli alsa-utils xorg-xrandr toilet man-db mpv mupdf emacs htop gdb fd mupdf-tools python-pip python-setuptools tree termdown obs-studio onefetch kolourpaint cuda opencl-nvidia binwalk pulseaudio-jack nix qutebrowser imagemagick chafa ueberzug lua51 cmatrix glm glfw python-beautifulsoup4 python-requests netcat perl-image-exiftool sleuthkit wireshark-qt ghidra python-pwntools bless php sublime-text ghostty go
elif [ -f "/etc/debian_version" ]; then
    echo "Debian detected!!!!!!"
    sudo apt install npm xclip ripgrep ninja-build gettext cmake unzip curl build-essential git gcc clang toilet kitty htop tree pypy3 kolourpaint mypaint libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev pkg-config luarocks vim brightnessctl exiftool libx11-dev gdb feh gh mpv jq uuid libxrandr-dev pulseaudio pulseaudio-utils libpcap0.8-dev flex bison intel-gpu-tools python3-full python3-pip network-manager mupdf mupdf-tools strace valgrind mc alsa-utils libwayland-dev libxkbcommon-dev xorg-dev power-profiles-daemon cinnamon libglu1-mesa-dev libasio-dev llvm python3-bs4 ncal trash-cli qutebrowser fd-find cmatrix btop default-jdk maven
fi
