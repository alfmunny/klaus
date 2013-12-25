#! /bin/bash

# Erkennungsgrad

echo "Die Erkennungsgrad:"
tail -n +3 schreiber_testdata.result	\
	|cut -d: -f1	\
	|cut -d/ -f10 	\
	|cut -d_ -f1 	\
	| sed "N;s/\n/ /g"	\
	|awk '{if($1==$2)right++}END{print right/NR}'
