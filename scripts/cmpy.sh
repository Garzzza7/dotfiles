#!/bin/bash
read input_string
modified_string=$(echo $input_string | sed 's/[[:space:]\x27]/_/g')
touch $modified_string.py
touch $modified_string.txt
cp $HOME/zadania/MINTEMPLATE.py $modified_string.py
vim $modified_string.txt $modified_string.py
