#!/bin/bash

if [ -f "/etc/arch-release" ]; then
	echo "Arch detected!!!!!!"
	sudo pacman -S emacs
elif [ -f "/etc/debian_version" ]; then
	echo "Debian detected!!!!!!"
	git clone https://git.savannah.gnu.org/git/emacs.git $HOME/emacs

	cd $HOME/emacs

	git pull

	sudo apt update
	sudo apt install -y autoconf make gcc texinfo libgtk-3-dev libxpm-dev libjpeg-dev libgif-dev libtiff5-dev libgnutls28-dev libncurses5-dev libjansson-dev libharfbuzz-dev libharfbuzz-bin imagemagick libmagickwand-dev libgccjit-10-dev libgccjit0 gcc-10 libjansson4 libjansson-dev xaw3dg-dev texinfo libx11-dev

	export CC="gcc-10"

	sudo ./autogen.sh

	sudo ./configure -with-json --with-modules --with-harfbuzz --with-compress-install \
		--with-threads --with-included-regex --with-x-toolkit=lucid --with-zlib --with-jpeg --with-png --with-imagemagick --with-tiff --with-xpm --with-gnutls \
		--with-xft --with-xml2 --with-mailutils --with-native-compilation CFLAGS='-Ofast'

	time sudo make -j$(nproc)

	sudo make install
fi
