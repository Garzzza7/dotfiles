#!/bin/bash
for path in `find ./ -name '*.sh'`
do
    /home/pc/.local/share/nvim/mason/bin/beautysh $path
done
