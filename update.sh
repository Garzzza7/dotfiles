#!/bin/bash

if [ "$(which i3)" ]; then
    echo I3 found.
    cp -r $HOME/.config/i3/* i3/
    cp -r $HOME/.config/i3status/* i3status/
else
    echo Omitting I3.
fi

if [ "$(which emacs)" ]; then
    echo Emacs found.
    cp -r $HOME/.emacs.d/* emacs/
else
    echo Omitting Emacs.
fi

if [ "$(which nvim)" ]; then
    echo Neovim found.
    cp -r $HOME/.config/nvim/init.lua nvim/init.lua
else
    echo Omitting Neovim.
fi

if [ "$(which vim)" ]; then
    echo Vim found.
    cp -r $HOME/.vimrc vim/vimrc
else
    echo Omitting Vim.
fi

if [ "$(which code)" ]; then
    echo VSCode found.
    cp -r $HOME/.config/Code/User/settings.json vscode/settings.json
    code --list-extensions > vscode/ext.txt
else
    echo Omitting VSCode.
fi

if [ "$(which omz)" ]; then
    echo OMZ found.
    cp -r $HOME/.zshrc omz/zshrc
else
    echo Omitting OMZ.
fi

if [ "$(which kitty)" ]; then
    echo Kitty found.
    cp -r $HOME/.config/kitty/* kitty/
else
    echo Omitting Kitty.
fi

if [ "$(which lazygit)" ]; then
    echo Lazygit found.
    cp $HOME/.config/lazygit/config.yml lazygit/config.yml
else
    echo Omitting Lazygit.
fi

if [ "$(which bash)" ]; then
    echo Bash found.
    cp $HOME/.bashrc bash/bashrc
else
    echo Omitting Bash.
fi

if [ -d "$HOME/scripts" ]; then
    echo Scripts found.
    cp -r $HOME/scripts/* scripts/
else
    echo Scripts does not exist.
fi

echo Done.
