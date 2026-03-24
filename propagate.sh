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
    cp -r tmux/tmux.conf $HOME/.tmux.conf
else
    printf "${red}Omitting Tmux\n${normal}"
fi

if is_installed gh; then
    printf "${green}GH found.\n${normal}"
    cp -r gh/config.yml $HOME/.config/gh/config.yml
else
    printf "${red}Omitting GH\n${normal}"
fi

if is_installed ghostty; then
    printf "${green}Ghostty found.\n${normal}"
    cp -r ghostty/config $HOME/.config/ghostty/config
else
    printf "${red}Omitting Ghostty\n${normal}"
fi

if is_installed qutebrowser; then
    printf "${green}Qutebrowser found.\n${normal}"
    cp -r qutebrowser/*.py $HOME/.config/qutebrowser/
else
    printf "${red}Omitting Qutebrowser\n${normal}"
fi

if is_installed neofetch; then
    printf "${green}Neofetch found.\n${normal}"
    cp neofetch/config.conf $HOME/.config/neofetch/config.conf
    cp neofetch/logo.txt $HOME/.config/neofetch/logo.txt
else
    printf "${red}Omitting Neofetch.\n${normal}"
fi

if is_installed i3; then
    printf "${green}i3 found.\n${normal}"
    cp i3/* $HOME/.config/i3/
    cp i3status/* $HOME/.config/i3status/
else
    printf "${red}Omitting i3.\n${normal}"
fi

if is_installed emacs; then
    printf "${green}Emacs found.\n${normal}"
    cp -r emacs/* $HOME/.emacs.d/
else
    printf "${red}Omitting Emacs.\n${normal}"
fi

if is_installed nvim; then
    printf "${green}Neovim found.\n${normal}"
    cp -r nvim/* $HOME/.config/nvim/
else
    printf "${red}Omitting Neovim.\n${normal}"
fi

if is_installed vim; then
    printf "${green}Vim found.\n${normal}"
    cp vim/vimrc $HOME/.vimrc
else
    printf "${red}Omitting Vim.\n${normal}"
fi

if [ -f $HOME/.zshrc ]; then
    printf "${green}OMZ found.\n${normal}"
    cp omz/zshrc $HOME/.zshrc
else
    printf "${red}Omitting OMZ.\n${normal}"
fi

if is_installed kitty; then
    printf "${green}Kitty found.\n${normal}"
    cp kitty/* $HOME/.config/kitty/
else
    printf "${red}Omitting Kitty.\n${normal}"
fi

if is_installed lazygit; then
    printf "${green}Lazygit found.\n${normal}"
    cp lazygit/config.yml $HOME/.config/lazygit/config.yml
else
    printf "${red}Omitting Lazygit.\n${normal}"
fi

if is_installed bash; then
    printf "${green}Bash found.\n${normal}"
    cp bash/bashrc $HOME/.bashrc
else
    printf "${red}Omitting Bash.\n${normal}"
fi

if [ -d "$HOME/scripts" ]; then
    printf "${green}Scripts found.\n${normal}"
    cp scripts/* $HOME/scripts/
else
    printf "${red}Scripts does not exist.\n${normal}"
fi

printf "${grey}Done.\n${normal}"
