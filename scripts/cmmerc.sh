#!/bin/bash
read input_string
modified_string=$(echo $input_string | sed 's/[[:space:]\x27]/_/g')
touch $modified_string.m
touch $modified_string.txt
cp $HOME/zadania/mintemplate.m $modified_string.m
vim $modified_string.txt $modified_string.m
