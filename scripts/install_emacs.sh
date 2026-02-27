#!/bin/bash

if [ ! -d "$HOME/emacs" ]; then
    git clone https://git.savannah.gnu.org/git/emacs.git $HOME/emacs
fi

cd $HOME/emacs

git pull

# autoconf make gcc libgtk-3-dev libxpm-dev libjpeg-dev libgif-dev libtiff5-dev libgnutls28-dev libncurses5-dev libjansson-dev libharfbuzz-dev libharfbuzz-bin imagemagick libmagickwand-dev libgccjit-10-dev libgccjit0 gcc-10 libjansson4 libjansson-dev xaw3dg-dev texinfo libx11-dev

export CC="gcc"

sudo ./autogen.sh

sudo ./configure \
    --disable-option-checking \
    --enable-autodepend \
    --enable-check-lisp-object-type \
    --enable-cross-guesses=conservative \
    --enable-gcc-warnings \
    --enable-gtk-deprecation-warnings \
    --enable-link-time-optimization \
    --with-dbus \
    --with-dumping=pdumper \
    --with-file-notification=yes \
    --with-imagemagick \
    --with-native-compilation=yes \
    --with-pdumper=yes \
    --with-pgtk \
    --with-sound=alsa \
    --with-tree-sitter \
    --with-wide-int \
    --with-x \
    --with-x-toolkit=yes \
    --with-xwidgets

time sudo make -j$(nproc)

sudo make install
