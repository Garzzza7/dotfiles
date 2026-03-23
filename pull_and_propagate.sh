#!/bin/bash
set -e
black=$(tput setaf 16)
blue=$(tput setaf 4)
darkblue=$(tput setaf 17)
green=$(tput setaf 6)
grey=$(tput setaf 7)
invincible=$(tput setaf 0)
lightblue=$(tput setaf 12)
lightgreen=$(tput setaf 14)
normal=$(tput sgr0)
pink=$(tput setaf 13)
purple=$(tput setaf 5)
red=$(tput setaf 1)
vividblue=$(tput setaf 20)
vividred=$(tput setaf 9)
white=$(tput setaf 15)
yellow=$(tput setaf 3)
ygreen=$(tput setaf 2)

res="$(git pull)"
if [ "$res" != "Already up to date." ]; then
    printf "${grey}Changes detected.\n${normal}"
    bash propagate.sh
else
    printf "${grey}Nothing new to propagate.\n${normal}"
fi
