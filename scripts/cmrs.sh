#!/bin/bash
read input_string
modified_string=$(echo $input_string | sed 's/[[:space:]\x27]/_/g')
touch $modified_string.rs
touch $modified_string.txt
cp $HOME/zadania/MINTEMPLATE.rs $modified_string.rs
vim $modified_string.txt $modified_string.rs
