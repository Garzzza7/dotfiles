#!/bin/bash
input="$1"
suffix=".${input##*.}"
prefix="${input%%.*}"
if [[ "$suffix" == ".cpp" ]]; then
    compc.sh $input
elif [[ "$suffix" == ".py" ]]; then
    comppy.sh $input
elif [[ "$suffix" == ".rs" ]]; then
    comprs.sh $input
elif [[ "$suffix" == ".m" ]]; then
    compmerc.sh $input
else
    echo "Unknown language!!!"
fi
