#!/bin/bash
set -e
str="$(curl -s https://wttr.in | tac | tac | head -n 7)"
printf "${str}\n"
