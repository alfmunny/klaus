#! /bin/bash

#
# NOTE: tools are found in $(ESMERALDA)/bin
#

name=klaus
SRC=$HOME/esmeralda/lab/klaus/lin
DES=$HOME/esmeralda/lab/klaus/md_ufv
srctype=".pgm"
desttype=".ufv"

#
# frame extraction parameters
#
method=2	# feature extraction method 
width=$1	# frame width
x=$2		# frame overlap :-(
if [ ! $# == 2 ];then
	width=14
	x=13
	echo "Usage is:"
	echo "  ""$0 [<Breite>] [<Überlappung>]"
	echo "Die Parameter von dem Fenster sind nicht eingestellt..."
	echo "Die Einstellung wird automatisch eingestellt..."
fi

echo "Starten..."
echo "Breite:" $width "Pixel" 
echo "Überlappung:" $x "Pixel"

#cats=`(cd $SRC; ls *_scale.pgm)` #bearbeitete Bilder
cats=`(cd $SRC; ls -d [Binaerbilder]*)`
par_name="w$width""x$x"

if [ ! -d $DES/$par_name ];then
	mkdir $DES/$par_name
	echo "Das neue Ordner "$par_name" wird angelegt..."
	echo "Die Merkmale von den Bildern werden extrahiert..."
	echo "Bitte wenige Geduld haben..."
	for cat in $cats
	do
		if [ ! -d $DES/$par_name/$cat ]; then
			mkdir $DES/$par_name/$cat
		fi
		lines=`(cd $SRC/$cat; ls *$srctype)`
		for lin in $lines
		do
			base=`basename $lin $srctype`

			#echo $base
			(cat $SRC/$cat/$lin	\
				|im_filter binarize 1	\
				|pen_fextract -f $method -w $width -x $x	\
				>$DES/$par_name/$cat/$base$desttype) 2>/dev/null
		done
	done
fi
echo "Die Extraktion ist erledigt"
echo "Die Merkmale sind unter Odner md_ufv/$par_name gespeichert"
echo "Fertig"
