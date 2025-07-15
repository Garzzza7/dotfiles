#!/bin/bash

if [ -f "/etc/arch-release" ]; then
	echo "Arch detected!!!!!!"
elif [ -f "/etc/debian_version" ]; then
	echo "Debian detected!!!!!!"
	sudo apt-get reinstall network-manager
	sudo apt reinstall firmware-b43-installer
	sudo apt-get install --reinstall bcmwl-kernel-source
fi
