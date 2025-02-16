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

sub install_perl_lsp(){
	system "npm install -g --prefix $path/lsps/perllsp perlnavigator-server";
	system "ln -s $path/lsps/perllsp/bin/perlnavigator $path/symlinks/perlnavigator";
	system "cpan App::cpanminus";
	system "sudo cpanm -n Neovim::Ext";
}

sub install_opencl_lsp(){
	system "mkdir $path/lsps/opencllsp";
	system "curl -L https://github.com/Galarius/opencl-language-server/releases/download/0.6.3/opencl-language-server-linux-x86_64.tar.gz --output opencllsp.tar.gz";
	system "tar -xvf opencllsp.tar.gz -C $path/lsps/opencllsp";
	system "rm opencllsp.tar.gz";
	system "ln -s $path/lsps/opencllsp/opencl-language-server $path/symlinks/opencl-language-server";
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

sub install_asmlsp(){
	system "mkdir $path/lsps/asm-lsp";
	system "cargo install --root $path/lsps/asm-lsp asm-lsp";
	system "ln -s $path/lsps/asm-lsp/bin/asm-lsp $path/symlinks/asm_lsp";
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
	system "mkdir $path/lsps/haskell-ls";
	system "ghcup install hls -i $path/lsps/haskell-ls";
	system "ln -s $path/lsps/haskell-ls/bin/haskell-language-server-9.4.8 $path/symlinks/haskell-language-server-wrapper";
}

sub install_gl_ls(){
	my $version = "v1.5.1";
	system "mkdir $path/lsps/gl-analyzer";
	system "wget -P $path/lsps/gl-analyzer https://github.com/nolanderc/glsl_analyzer/releases/download/$version/x86_64-linux-musl.zip";
	system "unzip $path/lsps/gl-analyzer/x86_64-linux-musl.zip -d $path/lsps/gl-analyzer";
	system "rm $path/lsps/gl-analyzer/x86_64-linux-musl.zip";
	system "ln -s $path/lsps/gl-analyzer/bin/glsl_analyzer $path/symlinks/glsl_analyzer";

}

sub install_bash_ls(){
	system "npm install -g --prefix $path/lsps/bash-language-server bash-language-server";
	system "ln -s $path/lsps/bash-language-server/bin/bash-language-server $path/symlinks/bash-language-server";
}

sub install_vim_ls(){
	system "npm install -g --prefix $path/lsps/vim-language-server vim-language-server";
	system "ln -s $path/lsps/vim-language-server/bin/vim-language-server $path/symlinks/vim-language-server";
}

print "INSTALLING USEFULL LANGUAGE SERVERS !!!\n";
prepare();
install_pyright();
install_rust_analyzer();
install_lua_ls();
install_clangd();
install_neocmake();
install_bash_ls();
install_vim_ls();
install_gl_ls();
install_haskell_ls();
install_opencl_lsp();
install_perl_lsp();
install_asmlsp();
