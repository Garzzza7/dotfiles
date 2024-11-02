#!/bin/bash
grey=$(tput setaf 7)
vividblue=$(tput setaf 20)
darkblue=$(tput setaf 17)
black=$(tput setaf 16)
white=$(tput setaf 15)
lightgreen=$(tput setaf 14)
pink=$(tput setaf 13)
lightblue=$(tput setaf 12)
vividred=$(tput setaf 9)
purple=$(tput setaf 5)
invincible=$(tput setaf 0)
ygreen=$(tput setaf 2)
yellow=$(tput setaf 3)
red=$(tput setaf 1)
blue=$(tput setaf 4)
green=$(tput setaf 6)
normal=$(tput sgr0)

res=$(git pull)
if [ "$res" != "Already up to date." ]; then
    printf "${grey}Changes detected.\n"
    if [ "$(which i3)" ]; then
        printf "${green}I3 found.\n"
        cp i3/* $HOME/.config/i3/
        cp i3status/* $HOME/.config/i3status/
    else
        printf "${red}Omitting I3.\n"
    fi

    if [ "$(which emacs)" ]; then
        printf "${green}Emacs found.\n"
        cp emacs/* $HOME/.emacs.d/
    else
        printf "${red}Omitting Emacs.\n"
    fi

    if [ "$(which nvim)" ]; then
        printf "${green}Neovim found.\n"
        cp nvim/* $HOME/.config/nvim/
    else
        printf "${red}Omitting Neovim.\n"
    fi

    if [ "$(which vim)" ]; then
        printf "${green}Vim found.\n"
        cp vim/vimrc	$HOME/.vimrc
    else
        printf "${red}Omitting Vim.\n"
    fi

    if [ "$(which code)" ]; then
        printf "${green}VSCode found.\n"
        cp vscode/settings.json $HOME/.config/Code/User/settings.json
        cat vscode/ext.txt | xargs -L 1 code --install-extension
    else
        printf "${red}Omitting VSCode.\n"
    fi

    if [ -f $HOME/.zshrc ]; then
        printf "${green}OMZ found.\n"
        cp omz/zshrc $HOME/.zshrc
    else
        printf "${red}Omitting OMZ.\n"
    fi

    if [ "$(which kitty)" ]; then
        printf "${green}Kitty found.\n"
        cp kitty/* $HOME/.config/kitty/
    else
        printf "${red}Omitting Kitty.\n"
    fi

    if [ "$(which lazygit)" ]; then
        printf "${green}Lazygit found.\n"
        cp lazygit/config.yml $HOME/.config/lazygit/config.yml
    else
        printf "${red}Omitting Lazygit.\n"
    fi

    if [ "$(which bash)" ]; then
        printf "${green}Bash found.\n"
        cp bash/bashrc $HOME/.bashrc
    else
        printf "${red}Omitting Bash.\n"
    fi

    if [ -d "$HOME/scripts" ]; then
        printf "${green}Scripts found.\n"
        cp  scripts/* $HOME/scripts/
    else
        printf "${red}Scripts does not exist.\n"
    fi

    printf "${grey}Done.\n"
else
    printf "${grey}Nothing new to propagate.\n"
fi
