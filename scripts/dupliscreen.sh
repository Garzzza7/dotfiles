#!/bin/bash

if [ -f "/etc/arch-release" ]; then
    echo "Arch detected!!!!!!"
elif [ -f "/etc/debian-version" ]; then
    echo "Debian detected!!!!!!"
	xrandr --output HDMI-0 --auto --same-as eDP-1-1
fi

