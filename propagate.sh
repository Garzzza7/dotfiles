#!/bin/bash

if [ "$(git pull)" != "Already up to date." ]; then
    echo Changes detected.
    if [ "$(which i3)" ]; then
        echo I3 found.
        cp i3/* $HOME/.config/i3/
        cp i3status/* $HOME/.config/i3status/
    else
        echo Omitting I3.
    fi

    if [ "$(which emacs)" ]; then
        echo Emacs found.
        cp emacs/* $HOME/.emacs.d/
    else
        echo Omitting Emacs.
    fi

    if [ "$(which nvim)" ]; then
        echo Neovim found.
        cp nvim/* $HOME/.config/nvim/
    else
        echo Omitting Neovim.
    fi

    if [ "$(which vim)" ]; then
        echo Vim found.
        cp vim/vimrc	$HOME/.vimrc
    else
        echo Omitting Vim.
    fi

    if [ "$(which code)" ]; then
        echo VSCode found.
        cp vscode/settings.json $HOME/.config/Code/User/settings.json
        cat vscode/ext.txt | xargs -L 1 code --install-extension
    else
        echo Omitting VSCode.
    fi

    if [ "$(which omz)" ]; then
        echo OMZ found.
        cp omz/zshrc $HOME/.zshrc
    else
        echo Omitting OMZ.
    fi

    if [ "$(which kitty)" ]; then
        echo Kitty found.
        cp kitty/* $HOME/.config/kitty/
    else
        echo Omitting Kitty.
    fi

    if [ "$(which lazygit)" ]; then
        echo Lazygit found.
        cp lazygit/config.yml $HOME/.config/lazygit/config.yml
    else
        echo Omitting Lazygit.
    fi

    if [ "$(which bash)" ]; then
        echo Bash found.
        cp bash/bashrc $HOME/.bashrc
    else
        echo Omitting Bash.
    fi

    if [ -d "$HOME/scripts" ]; then
        echo Scripts found.
        cp  scripts/* $HOME/scripts/
    else
        echo Scripts does not exist.
    fi

    echo Done.
else
    echo Nothing new to propagate.
fi
