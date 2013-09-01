#! /bin/bash

paste -d ' ' $ESMERALDA/lab/klaus/hmm/word/klaus.word_12.eval $1 \
	| awk '{if($2==$4)right++}END{print right/NR}'
