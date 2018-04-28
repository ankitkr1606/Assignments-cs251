#!/bin/bash
input1=$(cat $1)
SAVEIFS=$IFS 
IFS=$'\n'
input1=($input1)
IFS=$SAVEIFS
for (( i=0; i<${#input1[@]}; i++ ))
do
	input1[$i]=$(echo -e "${input1[$i]}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
	#echo "${input1[$i]}"
	if [ "${input1[$i]}" ==  "<dir>" ]
	then
		i=$(($i+1))
		n=$(echo "${input1[$i]}" | sed 's/<\/\?[^>]\+>//g')
		n=$(echo -e "${n}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
		cur=$(pwd)
		mkdir $n
		cd $cur/$n
	fi 

	if [ "${input1[$i]}" ==  "<file>" ]
	then
		j=$(($i+1))
		i=$(($i+2))
		n=$(echo "${input1[$j]}" | sed 's/<\/\?[^>]\+>//g')
		n=$(echo -e "${n}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
		n1=$(echo "${input1[$i]}" | sed 's/<\/\?[^>]\+>//g')
		n1=$(echo -e "${n1}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
		dd if=/dev/zero of=$n  bs=$n1  count=1
	fi
	if [ "${input1[$i]}" ==  "</dir>" ]
	then
		cd ..
	fi
done
