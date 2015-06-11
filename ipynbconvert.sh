#!/bin/bash

OUT_NOTEBOOK_DIR=$(echo ~/Documents/MonPhD/Notebooks)
IN_NOTEBOOK_DIR=$(echo ~/Documents/MonPhD)
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
TEMPLATE_DIR=$(echo $DIR | awk -F"/" '{for (i=4; i<=NF; i++) printf $i"/"}') # because pb in ipython nbconvert
mkdir -p $OUT_NOTEBOOK_DIR

cd ~

find $IN_NOTEBOOK_DIR -type f  ! -name '*checkpoint*' -name "*.ipynb" -print0 | while IFS= read -r -d '' file; do
     
    printf '%s\n' "$file";
    n=${file#*"$IN_NOTEBOOK_DIR"/}
    outdir=${n%\/*}
    name=${n##*\/}

    mkdir -p $OUT_NOTEBOOK_DIR/"$outdir"
    ipython nbconvert --template $TEMPLATE_DIR/output\_toggle "$file" --output $OUT_NOTEBOOK_DIR/"$outdir"/"${name%.*}";
done
date >> $OUT_NOTEBOOK_DIR/convert.log
