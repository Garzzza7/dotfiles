#!/bin/bash
# for path in `find ./ -name '*.cpp'`
# do
#     /home/pc/.local/share/nvim/mason/bin/clang-format -i $path
# done
$HOME/.local/share/nvim/mason/bin/clang-format -i *.cpp
$HOME/.local/share/nvim/mason/bin/clang-format -i *.h
$HOME/.local/share/nvim/mason/bin/clang-format -i *.cc
