#!/bin/bash

xrandr --output HDMI-0 --auto --same-as eDP-1-1
pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo

if command -v google-chrome 2>&1 >/dev/null; then
	google-chrome https://www.netflix.com/browse &
elif command -v chromium-browser 2>&1 >/dev/null; then
	chromium-browser https://www.netflix.com/browse &
elif command -v firefox 2>&1 >/dev/null; then
	firefox https://www.netflix.com/browse &
else
	install_chrome.sh
	google-chrome https://www.netflix.com/browse &
fi
