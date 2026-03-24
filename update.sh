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

function is_installed() {
    command -v "$1" >/dev/null 2>&1
}

if is_installed tmux; then
    printf "${green}Tmux found.\n${normal}"
    cp -r $HOME/.tmux.conf tmux/tmux.conf
else
    printf "${red}Omitting Tmux.\n${normal}"
fi

if is_installed gh; then
    printf "${green}GH found.\n${normal}"
    cp -r $HOME/.config/gh/config.yml gh/config.yml
else
    printf "${red}Omitting GH.\n${normal}"
fi

if is_installed ghostty; then
    printf "${green}Ghostty found.\n${normal}"
    cp -r $HOME/.config/ghostty/config ghostty/config
else
    printf "${red}Omitting Ghostty.\n${normal}"
fi

if is_installed qutebrowser; then
    printf "${green}Qutebrowse found.\n${normal}"
    cp -r $HOME/.config/qutebrowser/*.py qutebrowser/
else
    printf "${red}Omitting Qutebrowse.\n${normal}"
fi

if is_installed neofetch; then
    printf "${green}Neofetch found.\n${normal}"
    cp -r $HOME/.config/neofetch/config.conf neofetch/config.conf
    cp -r $HOME/.config/neofetch/logo.txt neofetch/logo.txt
else
    printf "${red}Omitting Neofetch.\n${normal}"
fi

if is_installed i3; then
    printf "${green}i3 found.\n${normal}"
    cp -r $HOME/.config/i3/* i3/
    cp -r $HOME/.config/i3status/* i3status/
else
    printf "${red}Omitting i3.\n${normal}"
fi

if is_installed emacs; then
    printf "${green}Emacs found.\n${normal}"
    cp -r $HOME/.emacs.d/init.el emacs/init.el
else
    printf "${red}Omitting Emacs.\n${normal}"
fi

if is_installed nvim; then
    printf "${green}Neovim found.\n${normal}"
    trash-put $HOME/dotfiles/nvim/*
    cp -r $HOME/.config/nvim/* nvim/
else
    printf "${red}Omitting Neovim.\n${normal}"
fi

if is_installed vim; then
    printf "${green}Vim found.\n${normal}"
    cp -r $HOME/.vimrc vim/vimrc
else
    printf "${red}Omitting Vim.\n${normal}"
fi

if [ -f $HOME/.zshrc ]; then
    printf "${green}OMZ found.\n${normal}"
    cp -r $HOME/.zshrc omz/zshrc
else
    printf "${red}Omitting OMZ.\n${normal}"
fi

if is_installed kitty; then
    printf "${green}Kitty found.\n${normal}"
    cp -r $HOME/.config/kitty/* kitty/
else
    printf "${red}Omitting Kitty.\n${normal}"
fi

if is_installed lazygit; then
    printf "${green}Lazygit found.\n${normal}"
    cp $HOME/.config/lazygit/config.yml lazygit/config.yml
else
    printf "${red}Omitting Lazygit.\n${normal}"
fi

if is_installed bash; then
    printf "${green}Bash found.\n${normal}"
    cp $HOME/.bashrc bash/bashrc
else
    printf "${red}Omitting Bash.\n${normal}"
fi

if [ -d "$HOME/scripts" ]; then
    printf "${green}Scripts found.\n${normal}"
    cp -r $HOME/scripts/* scripts/
else
    printf "${red}Scripts does not exist.\n${normal}"
fi

printf "${grey}Done.\n${normal}"
