#!/usr/bin/perl
use v5.38.2;
use strict;
use warnings;

my $path = "~";

sub prepare(){
	system "mkdir ~/lsps";
	system "mkdir ~/symlinks";
	my $export = 'export PATH=$PATH:'.$path.'/symlinks';
	system "$export";
}

sub install_clangd(){
}

sub install_rust_analyzer(){
}

sub install_pyright(){
	system "npm install -g --prefix $path/lsps/pyright pyright";
	system "ln -s $path/lsps/pyright/lib/node_modules/pyright/index.js ~/symlinks/pyright";
	system "ln -s $path/lsps/pyright/lib/node_modules/pyright/langserver.index.js ~/symlinks/pyright-langserver";
}

sub install_neocmake(){
}

sub install_lua_ls(){
}

sub install_haskell_ls(){
}

sub install_gl_ls(){
}

sub install_bash_ls(){
}

sub install_vim_ls(){
}

print "INSTALLING USEFULL LANGUAGE SERVERS !!!\n";
#prepare();
install_pyright();
