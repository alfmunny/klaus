#!/bin/bash
width=$1
x=$2
pgm=$3
SRC=Codebook
param=2
pen_fextract -f $param -w $1 -x $2 $3 tmp/tmp.ufv
md_classify -Mg $SRC/Schreiber_all.cl < tmp/tmp.lst > tmp/tmp.ergebnis 2>a
#echo
#echo "Der erkannte Schreiber:"
cat tmp/tmp.ergebnis | tail -1 |cut -d: -f1
#echo
