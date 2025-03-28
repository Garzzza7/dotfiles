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
invisible=$(tput setaf 0)
ygreen=$(tput setaf 2)
yellow=$(tput setaf 3)
red=$(tput setaf 1)
blue=$(tput setaf 4)
green=$(tput setaf 6)
normal=$(tput sgr0)

if command -v qutebrowser 2>&1 >/dev/null
then
    printf "${green}Qutebrowse found.\n${normal}"
    cp -r $HOME/.config/qutebrowser/*.py qutebrowser/
else
    printf "${red}Omitting Qutebrowse.\n${normal}"
fi

if command -v neofetch 2>&1 >/dev/null
then
    printf "${green}Neofetch found.\n${normal}"
    cp -r $HOME/.config/neofetch/config.conf neofetch/config.conf
    cp -r $HOME/.config/neofetch/logo.txt neofetch/logo.txt
else
    printf "${red}Omitting Neofetch.\n${normal}"
fi

if command -v subl 2>&1 >/dev/null
then
    printf "${green}Sublime Text found.\n${normal}"
    cp -r $HOME/.config/sublime-text/Packages/User/Preferences.sublime-settings sublime/Preferences.sublime-settings
else
    printf "${red}Omitting Sublime Text.\n${normal}"
fi

if command -v i3 2>&1 >/dev/null
then
    printf "${green}i3 found.\n${normal}"
    cp -r $HOME/.config/i3/* i3/
    cp -r $HOME/.config/i3status/* i3status/
else
    printf "${red}Omitting i3.\n${normal}"
fi

if command -v emacs 2>&1 >/dev/null
then
    printf "${green}Emacs found.\n${normal}"
    cp -r $HOME/.emacs.d/init.el emacs/init.el
    cp -r $HOME/.emacs.d/modes/* emacs/modes/
else
    printf "${red}Omitting Emacs.\n${normal}"
fi

if command -v nvim 2>&1 >/dev/null
then
    printf "${green}Neovim found.\n${normal}"
    cp -r $HOME/.config/nvim/* nvim/
else
    printf "${red}Omitting Neovim.\n${normal}"
fi

if command -v vim 2>&1 >/dev/null
then
    printf "${green}Vim found.\n${normal}"
    cp -r $HOME/.vimrc vim/vimrc
else
    printf "${red}Omitting Vim.\n${normal}"
fi

if command -v code 2>&1 >/dev/null
then
    printf "${green}VSCode found.\n${normal}"
    # cp -r $HOME/.config/Code/User/settings.json vscode/settings.json
    # code --list-extensions > vscode/ext.txt
else
    printf "${red}Omitting VSCode.\n${normal}"
fi

if [ -f $HOME/.zshrc ]; then
    printf "${green}OMZ found.\n${normal}"
    cp -r $HOME/.zshrc omz/zshrc
else
    printf "${red}Omitting OMZ.\n${normal}"
fi

if command -v kitty 2>&1 >/dev/null
then
    printf "${green}Kitty found.\n${normal}"
    cp -r $HOME/.config/kitty/* kitty/
else
    printf "${red}Omitting Kitty.\n${normal}"
fi

if command -v lazygit 2>&1 >/dev/null
then
    printf "${green}Lazygit found.\n${normal}"
    cp $HOME/.config/lazygit/config.yml lazygit/config.yml
else
    printf "${red}Omitting Lazygit.\n${normal}"
fi

if command -v bash 2>&1 >/dev/null
then
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

if command -v mc 2>&1 >/dev/null
then
    printf "${green}Midnight Commander found.\n${normal}"
    cp $HOME/.config/mc/ini mc/ini
else
    printf "${red}Omitting Midnight Commander.\n${normal}"
fi

printf "${grey}Done.\n${normal}"
