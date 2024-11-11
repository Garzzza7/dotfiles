#!/bin/bash
read input_string
modified_string=$(echo $input_string | sed 's/[[:space:]\x27]/_/g')
touch $modified_string.cpp
touch $modified_string.txt
cp $HOME/zadania/MODTEMPLATE.cpp $modified_string.cpp
nvim $modified_string.*
