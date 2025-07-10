#!/bin/bash
set -e
str="$(curl -s https://wttr.in/Moon | tac | tac | head -n 23)"
printf "${str}\n"
