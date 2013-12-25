#! /bin/bash

# NOTEL:tools are found in $(ESMERALDA)/bin

model=$1

SRC=Codebook
DES=Codebook

parameter="-m"
md_param $parameter $SRC/*.$model.cl -cf 0- > $DES/Schreiber_all.cl 2>$DES/Schreiber_all.err
