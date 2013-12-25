#! /bin/bash
# die Schreibererkennung werden unter verschiendene Bedingungen
# durchgeführt.
#Die Ergebnisse werden unter aus.txt gespeichert.

lst=test_12.lst

#Merkmale generieren

echo "die Merkamale extrahieren..."
echo

./schreiber_merkmale.sh 2 1
./schreiber_merkmale.sh	4 1
./schreiber_merkmale.sh	4 2
./schreiber_merkmale.sh	4 3
./schreiber_merkmale.sh	6 3
./schreiber_merkmale.sh	6 4
./schreiber_merkmale.sh	6 5
./schreiber_merkmale.sh	8 4
./schreiber_merkmale.sh	8 5
./schreiber_merkmale.sh	8 6
./schreiber_merkmale.sh	8 7
./schreiber_merkmale.sh	10 7
./schreiber_merkmale.sh	10 8
./schreiber_merkmale.sh	10 9
./schreiber_merkmale.sh	12 9
./schreiber_merkmale.sh	12 10
./schreiber_merkmale.sh	12 11
./schreiber_merkmale.sh	14 11
./schreiber_merkmale.sh	14 12
./schreiber_merkmale.sh	14 13

echo `date` >aus.txt
for doc in `ls -d ../md_ufv/*` #alle Merkmale unter md_ufv/ 
do
	echo '########################################' >>aus.txt
	width=`basename $doc	\
		| cut -d'w' -f2 	\
		| cut -d'x' -f1` 
	x=`basename $doc	\
		| cut -d'x' -f2` 
	echo "#width:$width x:$x" >>aus.txt
	echo '########################################' >>aus.txt
	echo '----------------------------------------' >>aus.txt
	for group in 10 20 30 40 50 60 70 80 85 90  #die Gruppe einstellen
	do
		echo "width:$width x:$x group:$group"
		./schreiber_md_k_means.sh $width $x $group
		./schreiber_train.sh $width $x 20
		./schreiber_md_param.sh 20
		./schreiber_erkennen_list.sh $width $x $lst 2>>aus.txt
		pro=`./schreiber_auswerten.sh | tail -1`
		echo $pro
		echo '----------------------------------------' >>aus.txt
		echo "group:$group Erkennungsgrad:$pro" >>aus.txt
		echo '----------------------------------------' >>aus.txt
	done
done 
