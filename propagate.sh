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

if command -v qutebrowser 2>&1 >/dev/null
then
    printf "${green}Qutebrowser found.\n${normal}"
    cp -r qutebrowser/*.py $HOME/.config/qutebrowser/
else
    printf "${red}Omitting Qutebrowser\n${normal}"
fi

if command -v neofetch 2>&1 >/dev/null
then
    printf "${green}Neofetch found.\n${normal}"
    cp neofetch/config.conf $HOME/.config/neofetch/config.conf
    cp neofetch/logo.txt $HOME/.config/neofetch/logo.txt
else
    printf "${red}Omitting Neofetch.\n${normal}"
fi

if command -v subl 2>&1 >/dev/null
then
    printf "${green}Sublime Text found.\n${normal}"
    cp -r sublime/Preferences.sublime-settings $HOME/.config/sublime-text/Packages/User/Preferences.sublime-settings
else
    printf "${red}Omitting Sublime Text.\n${normal}"
fi

if command -v i3 2>&1 >/dev/null
then
    printf "${green}i3 found.\n${normal}"
    cp i3/* $HOME/.config/i3/
    cp i3status/* $HOME/.config/i3status/
else
    printf "${red}Omitting i3.\n${normal}"
fi

if command -v emacs 2>&1 >/dev/null
then
    printf "${green}Emacs found.\n${normal}"
    cp -r emacs/* $HOME/.emacs.d/
else
    printf "${red}Omitting Emacs.\n${normal}"
fi

if command -v nvim 2>&1 >/dev/null
then
    printf "${green}Neovim found.\n${normal}"
    cp -r nvim/* $HOME/.config/nvim/
else
    printf "${red}Omitting Neovim.\n${normal}"
fi

if command -v vim 2>&1 >/dev/null
then
    printf "${green}Vim found.\n${normal}"
    cp vim/vimrc	$HOME/.vimrc
else
    printf "${red}Omitting Vim.\n${normal}"
fi

if command -v code 2>&1 >/dev/null
then
    printf "${green}VSCode found.\n${normal}"
    # cp vscode/settings.json $HOME/.config/Code/User/settings.json
    #     cat vscode/ext.txt | xargs -L 1 code --install-extension
else
    printf "${red}Omitting VSCode.\n${normal}"
fi

if [ -f $HOME/.zshrc ]; then
    printf "${green}OMZ found.\n${normal}"
    cp omz/zshrc $HOME/.zshrc
else
    printf "${red}Omitting OMZ.\n${normal}"
fi

if command -v kitty 2>&1 >/dev/null
then
    printf "${green}Kitty found.\n${normal}"
    cp kitty/* $HOME/.config/kitty/
else
    printf "${red}Omitting Kitty.\n${normal}"
fi

if command -v lazygit 2>&1 >/dev/null
then
    printf "${green}Lazygit found.\n${normal}"
    cp lazygit/config.yml $HOME/.config/lazygit/config.yml
else
    printf "${red}Omitting Lazygit.\n${normal}"
fi

if command -v bash 2>&1 >/dev/null
then
    printf "${green}Bash found.\n${normal}"
    cp bash/bashrc $HOME/.bashrc
else
    printf "${red}Omitting Bash.\n${normal}"
fi

if [ -d "$HOME/scripts" ]; then
    printf "${green}Scripts found.\n${normal}"
    cp  scripts/* $HOME/scripts/
else
    printf "${red}Scripts does not exist.\n${normal}"
fi

if command -v mc 2>&1 >/dev/null
then
    printf "${green}Midnight Commander found.\n${normal}"
    cp mc/ini $HOME/.config/mc/ini
else
    printf "${red}Omitting Midnight Commander.\n${normal}"
fi

printf "${grey}Done.\n${normal}"
