#!/bin/bash


if [ -f "/etc/arch-release" ]; then
    echo "Arch detected!!!!!!"
elif [ -f "/etc/debian_version" ]; then
    echo "Debian detected!!!!!!"
	sudo e4defrag /dev/sdb4
fi
