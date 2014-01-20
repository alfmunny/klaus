#! /bin/sh

lsts=`ls *.lst`
echo "" > whole.list

for lst in $lsts
	do
	cat $lst>>whole.list
done


