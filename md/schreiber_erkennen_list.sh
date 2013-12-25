#! /bin/bash
# alle Bilder in der Testlist erkennen.

# NOTE:tools are found in $(ESMERALDA)/bin

width=$1
x=$2
list=$3
SRC=Codebook

sed "s/\/md\_ufv/\/md\_ufv\/w"$width"x"$x"/" $list > lst.tmp
md_classify  -Mg  $SRC/Schreiber_all.cl < lst.tmp > schreiber_testdata.result
rm lst.tmp
