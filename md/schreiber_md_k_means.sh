#! /bin/bash

#
# NOTEL:tools are found in $(ESMERALDA)/bin
#

SRC=../md_list
DES=Codebook
type=".lst"

#
#k_means vector quantization parameter
#
parameter="-pg -da2"
width=$1
x=$2
group=$3

rm $DES/*.cl

lsts=`ls $SRC/*$type`
for lst in $lsts
do
	name=`basename $lst $type` 
	sed "s/\/md\_ufv/\/md\_ufv\/w"$width"x"$x"/" $lst > lst.tmp 
	md_k_means $parameter -n $name 10 $group lst.tmp > $DES/$name.cl 2>$DES/$name.cl.err
done
rm lst.tmp
