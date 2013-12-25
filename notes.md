notes for the process
==========

##Mon Dec 23 22:44:58 CST 2013

make a new branch to test result withou "slant" and "slope"

	git checkout -b makelines-without-slant-slope

result
	
	0.356

try to make a simple miexd density 

	mkdir md

	vi schreiber_merkmale.sh

	schreiber_merkmale.sh

	.......

	mkdir md_ufv

	mkdir md_list

##Tue Dec 24 21:55:33 CST 2013

selct some words (ca. 10%) in the 1157 words to test 

	ich 	16
	und 	15
	der 	11
	Sie 	10
	die 	10
	in		8
	ist 	8
	zu  	7
	so  	7
	den 	6
	nicht 	6
	daß 	6

generate the mixture-density
	
	./schreiber_merkmale.sh 14 13

	./schreiber_md_k_means.sh 14 13 40

	./schreiber_train.sh 14 13 10

	./schreiber_md_param.sh 10

	./schreiber_erkennen_list.sh 14 13 test_12.lst

	./schreiber_auswerten.sh

the result

	0.481818

 
##Thu Dec 26 03:30:57 CST 2013

generate the mixture-density of different configurations
	
	./schreiber_loop.sh

		
