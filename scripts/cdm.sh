#!/bin/bash
read input_string
modified_string=$(echo $input_string | sed 's/[[:space:]\x27]/_/g')
touch $modified_string.cpp
touch $modified_string.txt
cp $HOME/zadania/DEBMINTEMPLATE.cpp $modified_string.cpp
cp $HOME/zadania/debug.h ./
nvim $modified_string.txt $modified_string.cpp

