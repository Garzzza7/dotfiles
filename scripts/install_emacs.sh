#!/bin/bash
if [ ! -d "$HOME/emacs" ]; then
    git clone https://git.savannah.gnu.org/git/emacs.git $HOME/emacs
fi
cd $HOME/emacs
sudo git clean -fdx
git pull
export CC="clang"
export CFLAGS="-Ofast -ffast-math"
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
