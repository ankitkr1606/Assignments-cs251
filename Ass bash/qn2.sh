#!/bin/bash
indent=0
updatetots=0
updatetoti=0
sentence=0
counti=0
recurse(){
	updatetots=0
	updatetoti=0
	local tots=0
	local toti=0
	indent=$(($indent + 1))
	local files
	for files in $(ls "$1")
	do

		if [ -d "$1/$files" ]
		then
                	recurse "$1/$files"
			indent=$(($indent - 1))
			i=0
			while [ $i -lt $indent ];
            		do
                  		echo -n "   "
                  		i=$(($i+1))
            		done 
			echo "(D) $files-$updatetots-$updatetoti"
			tots=$(($tots+$updatetots))
			toti=$(($toti+$updatetoti))
		else
			sentence=$(cat $1/$files | sed -E 's/([0-9]+\.[0-9]+)+//g'| grep -o -P '[\.\!\?]?[\w\d\s\-]+[\.\!\?]+'| wc -l)
			counti=$(cat $1/$files | sed -E 's/([0-9]+\.[0-9]+)+//g'| grep -Eo '\-?[0-9]+'| wc -l)
			i=0
			while [ $i -lt $indent ];
            		do
                  		echo -n "   "
                  		i=$(($i+1))
            		done 
			echo "(F) $files-$sentence-$counti"
			tots=$(($tots+$sentence))
			toti=$(($toti+$counti))	
		fi
		
		
	done
	updatetots=$tots
	updatetoti=$toti
}
recurse $1 
cut=$( echo $1 | grep -o '[^/]*$' )
echo "(D) $cut-$updatetots-$updatetoti"
