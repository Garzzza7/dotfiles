#!/bin/bash


cp i3/* $HOME/.config/i3/
cp i3status/* $HOME/.config/i3status/
cp emacs/* $HOME/.emacs.d/
cp nvim/* $HOME/.config/nvim/
cp vim/vimrc	$HOME/.vimrc
cp scripts/* $HOME/scripts/
# cp vscode/settings.json $HOME/.config/Code/User/settings.json
cp omz/zshrc $HOME/.zshrc
cp kitty/* $HOME/.config/kitty/
# cat vscode/ext.txt | xargs -L 1 code --install-extension
cp lazygit/config.yml $HOME/.config/lazygit/config.yml

