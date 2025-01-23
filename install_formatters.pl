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

#TODO: FIX PIP RELATED FORMATTERS.
sub install_clang_format(){
	system "mkdir $path/lsps/clang-format";
	system "python3 -m venv $path/lsps/clang-format";
	#system "source $path/lsps/clang-format/bin/activate";
	#system "pip install clang-format";
	system "ln -s $path/lsps/clang-format/bin/clang-format $path/symlinks/clang-format";
}

sub install_black(){
	system "mkdir $path/lsps/black";
	system "python3 -m venv $path/lsps/black";
	#system "source $path/lsps/black/bin/activate";
	#system "pip install black";
	system "ln -s $path/lsps/black/bin/black $path/symlinks/black";
}

sub install_beautysh(){
	system "mkdir $path/lsps/beautysh";
	system "python3 -m venv $path/lsps/beautysh";
	#system "source $path/lsps/beautysh/bin/activate";
	#system "pip install beautysh";
	system "ln -s $path/lsps/beautysh/bin/beautysh $path/symlinks/beautysh";
}

sub install_stylua(){
	system "mkdir $path/lsps/stylua";
	system "cargo install --root $path/lsps/stylua stylua";
	system "ln -s $path/lsps/stylua/bin/stylua $path/symlinks/stylua";

}

print "INSTALLING USEFULL FORMATTERS !!!\n";
prepare();
#install_clang_format();
#install_black();
#install_beautysh();
install_stylua();
