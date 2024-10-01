#!/bin/bash

cp -r $HOME/.config/i3/* i3/
cp -r $HOME/.config/nvim/init.lua nvim/
cp -r $HOME/.vimrc vim/.vimrc
cp -r $HOME/scripts/* scripts/
cp -r $HOME/.config/i3status/* i3status/
cp -r $HOME/.emacs.d/* emacs/
cp -r $HOME/.config/Code/User/settings.json vscode/settings.json
cp -r $HOME/.zshrc omz/.zshrc
code --list-extensions > vscode/ext.txt


