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


sub install_clang_format(){
	system "mkdir $path/lsps/clang-format";
	system "python3 -m pip install --target $path/lsps/clang-format clang-format";
	system "ln -s $path/lsps/clang-format/bin/clang-format $path/symlinks/clang-format";
}

sub install_black(){
	system "mkdir $path/lsps/black";
	system "python3 -m pip install --target $path/lsps/black black";
	system "ln -s $path/lsps/black/bin/black $path/symlinks/black";
}

sub install_beautysh(){
	my $name = "beautysh";
	system "mkdir $path/lsps/$name";
	system "python3 -m pip install --target $path/lsps/$name $name";
	system "ln -s $path/lsps/$name/bin/$name $path/symlinks/$name";
}

sub install_stylua(){
	system "mkdir $path/lsps/stylua";
	system "cargo install --root $path/lsps/stylua stylua";
	system "ln -s $path/lsps/stylua/bin/stylua $path/symlinks/stylua";

}

print "INSTALLING USEFULL FORMATTERS !!!\n";
prepare();
install_clang_format();
install_black();
install_beautysh();
#install_stylua();
