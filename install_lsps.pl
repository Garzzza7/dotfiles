#!/usr/bin/perl
use v5.38.2;
use strict;
use warnings;

my $path = "~";

sub prepare(){
	system "mkdir $path/lsps";
	system "mkdir $path/symlinks";
	my $export = 'export PATH=$PATH:'.$path.'/symlinks';
	system "$export";
}

sub install_clangd(){
	my $version = "19.1.2";
	system "mkdir $path/lsps/clangd";
	system "wget -P $path/lsps/clangd https://github.com/clangd/clangd/releases/download/$version/clangd-linux-$version.zip";
	system "unzip $path/lsps/clangd/clangd-linux-$version.zip -d $path/lsps/clangd";
	system "rm $path/lsps/clangd/clangd-linux-$version.zip";
	system "ln -s $path/lsps/clangd/clangd_$version/bin/clangd $path/symlinks/clangd";
}

sub install_rust_analyzer(){
	system "mkdir $path/lsps/rust-analyzer";
	system "curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > $path/lsps/rust-analyzer/rust-analyzer";
	system "chmod +x $path/lsps/rust-analyzer/rust-analyzer";
	system "ln -s $path/lsps/rust-analyzer/rust-analyzer $path/symlinks/rust-analyzer";

}

sub install_pyright(){
	system "npm install -g --prefix $path/lsps/pyright pyright";
	system "ln -s $path/lsps/pyright/lib/node_modules/pyright/index.js $path/symlinks/pyright";
	system "ln -s $path/lsps/pyright/lib/node_modules/pyright/langserver.index.js $path/symlinks/pyright-langserver";
}

sub install_neocmake(){
	system "mkdir $path/lsps/neocmake";
	system "cargo install --root $path/lsps/neocmake neocmakelsp";
	system "ln -s $path/lsps/neocmake/bin/neocmakelsp $path/symlinks/neocmakelsp";
}

sub install_lua_ls(){
	my $version = "3.13.5";
	system "mkdir $path/lsps/lua_ls";
	system "curl -L https://github.com/LuaLS/lua-language-server/releases/download/$version/lua-language-server-$version-linux-x64.tar.gz --output lua.tar.gz";
	system "tar -xvf lua.tar.gz -C $path/lsps/lua_ls";
	system "rm lua.tar.gz";
	system "ln -s $path/lsps/lua_ls/bin/lua-language-server $path/symlinks/lua-language-server";
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
prepare();
install_pyright();
install_rust_analyzer();
install_lua_ls();
install_clangd();
install_neocmake();
