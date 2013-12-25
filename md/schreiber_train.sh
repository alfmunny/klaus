#! /bin/bash

#
#

LST=../md_list
CODE=Codebook

width=$1
x=$2
n=$3

#
#EM training

inis=`ls $CODE/*.cl`
 

for ini in $inis
do 
	basename=`basename $ini .cl`
	lst=$LST/$basename.lst
	echo $lst
	sed "s/\/md\_ufv/\/md\_ufv\/w"$width"x"$x"/" $lst > lst.tmp 
	md_train $ini < lst.tmp > $CODE/$basename.1.accu
	md_param $ini < $CODE/$basename.1.accu >$CODE/$basename.1.cl
	let t=$n-1	
	for freq in `seq 1 $t`
	do
		let out=freq+1
		echo $out
		md_train $CODE/$basename.$freq.cl < lst.tmp >$CODE/$basename.$out.accu
		md_param $CODE/$basename.$freq.cl < $CODE/$basename.$out.accu >$CODE/$basename.$out.cl
	done
done	

rm lst.tmp
