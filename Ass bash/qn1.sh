#!/bin/bash
read n
len=$(echo $n | wc -c)
if [[ $n =~ [^[:digit:]] ]]
then
	echo "invalid input"
	exit
fi


for((i=1; i<$len ;i++))
do
	chkd=$(echo $n | cut -c $i)
	if [ $chkd -eq 0 ]
	then
		continue
	else
		break
	fi
done
j=$i
k=0
l=0
len=$(( $len - i ))
if [ $len -eq 0 ]
then
	echo "zero"
	exit
fi
flag=0
while [ $len -gt 0 ]
do
	digit=$(echo $n | cut -c $i)
	if [ $len -eq 11 -o $len -eq 4 ]
	then
		case $digit in
			1) echo -n "one thousand "
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;	
        		2) echo -n "two thousand " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
        		3) echo -n "three thousand " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
       			4) echo -n "four thousand " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
       			5) echo -n "five thousand " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
        		6) echo -n "six thousand " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
        		7) echo -n "seven thousand " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
       			8) echo -n "eight thousand "
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;; 
       			9) echo -n "nine thousand " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
			0) if [ $k -eq 1 ]
			   then
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
			   else
				echo -n "thousand " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
			   fi
			   ;;		
		esac
	fi

	if [ $len -eq 10 -o $len -eq 3 ]
	then
		digit=$(echo $n | cut -c $i)
		case "$digit" in
			1) echo -n "one hunderd "
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;	
        		2) echo -n "two hunderd " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
        		3) echo -n "three hunderd " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
       			4) echo -n "four hunderd " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
       			5) echo -n "five hunderd " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
        		6) echo -n "six hunderd " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
        		7) echo -n "seven hunderd " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
       			8) echo -n "eight hunderd "
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;; 
       			9) echo -n "nine hunderd " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
			0) 
			   	i=$(( $i + 1 ))
			   	len=$(( $len - 1 ))
				;;
		esac
	fi
	if [ $len -eq 9 ]
	then
		digit=$(echo $n | cut -c $i)
		if [ $digit -eq 1 ]
		then 
			i=$(( $i + 1 ))
			digit=$(echo $n | cut -c $i)
			case $digit in
				1) echo -n "eleven crores "
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;	
				2) echo -n "twelve crores " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
				3) echo -n "thirteen crores " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
	       			4) echo -n "fourteen crores " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
	       			5) echo -n "fifteen crores " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
				6) echo -n "sixteen crores " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
				7) echo -n "seventeen crores " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
	       			8) echo -n "eighteen crores "
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;; 
	       			9) echo -n "nineteen crores " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
				0) echo -n "ten crores "
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
			esac
		else
			case $digit in					
				2) echo -n "twenty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
				3) echo -n "thirty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
	       			4) echo -n "fourty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
	       			5) echo -n "fifty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
				6) echo -n "sixty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
				7) echo -n "seventy " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
	       			8) echo -n "eighty "
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;; 
	       			9) echo -n "ninety " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
				0) 	
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
			esac
		fi
	fi
	if [ $len -eq 8 ]
	then
		digit=$(echo $n | cut -c $i)
		case $digit in
			1) echo -n "one crores "
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;	
        		2) echo -n "two crores " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
        		3) echo -n "three crores " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
       			4) echo -n "four crores " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
       			5) echo -n "five crores " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
        		6) echo -n "six crores " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
        		7) echo -n "seven crores " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
       			8) echo -n "eight crores "
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;; 
       			9) echo -n "nine crores " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
			0) echo -n "crores "
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;		
		esac
	fi
	if [ $len -eq 7 ]
	then
		digit=$(echo $n | cut -c $i)
		if [ $digit -eq 1 ]
		then 
			i=$(( $i + 1 ))
			digit=$(echo $n | cut -c $i)
			case $digit in
				1) echo -n "eleven lakhs "
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;	
				2) echo -n "twelve lakhs " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
				3) echo -n "thirteen lakhs " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
	       			4) echo -n "fourteen lakhs " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
	       			5) echo -n "fifteen lakhs " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
				6) echo -n "sixteen lakhs " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
				7) echo -n "seventeen lakhs " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
	       			8) echo -n "eighteen lakhs "
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;; 
	       			9) echo -n "nineteen lakhs " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
				0) echo -n "ten lakhs "
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
			esac
		else
			case $digit in					
				2) echo -n "twenty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
				3) echo -n "thirty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
	       			4) echo -n "fourty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
	       			5) echo -n "fifty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
				6) echo -n "sixty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
				7) echo -n "seventy " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
	       			8) echo -n "eighty "
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;; 
	       			9) echo -n "ninety " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
				0) 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
				   	l=1
					;;
			esac
		fi
	fi
	if [ $len -eq 6 ]
	then
		digit=$(echo $n | cut -c $i)
		case $digit in
			1) echo -n "one lakhs "
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;	
        		2) echo -n "two lakhs " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
        		3) echo -n "three lakhs " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
       			4) echo -n "four lakhs " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
       			5) echo -n "five lakhs " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
        		6) echo -n "six lakhs " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
        		7) echo -n "seven lakhs " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
       			8) echo -n "eight lakhs "
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;; 
       			9) echo -n "nine lakhs " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
			0) if [ $l -eq 1 ]
			   then
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
			   	continue
			   else
				echo -n "lakhs "
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
			   fi
			   ;;		
		esac
	fi
	if [ $len -eq 5 ]
	then
		digit=$(echo $n | cut -c $i)
		if [ $digit -eq 1 ]
		then 
			i=$(( $i + 1 ))
			digit=$(echo $n | cut -c $i)
			case $digit in
				1) echo -n "eleven thousand "
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;	
				2) echo -n "twelve thousand " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
				3) echo -n "thirteen thousand " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
	       			4) echo -n "fourteen thousand " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
	       			5) echo -n "fifteen thousand " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
				6) echo -n "sixteen thousand " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
				7) echo -n "seventeen thousand " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
	       			8) echo -n "eighteen thousand "
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;; 
	       			9) echo -n "nineteen thousand " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
				0) echo -n "ten thousand "
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
			esac
		else
			case $digit in					
				2) echo -n "twenty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
				3) echo -n "thirty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
	       			4) echo -n "fourty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
	       			5) echo -n "fifty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
				6) echo -n "sixty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
				7) echo -n "seventy " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
	       			8) echo -n "eighty "
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;; 
	       			9) echo -n "ninety " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
				0) 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
				 	k=1
					;;
			esac
		fi
	fi
	if [ $len -eq 2 ]
	then
		digit=$(echo $n | cut -c $i)
		if [ $digit -eq 1 ]
		then 
			i=$(( $i + 1 ))
			digit=$(echo $n | cut -c $i)
			case $digit in
				1) echo  "eleven "
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;	
				2) echo  "twelve " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
				3) echo  "thirteen " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
	       			4) echo  "fourteen " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
	       			5) echo  "fifteen " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
				6) echo  "sixteen " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
				7) echo  "seventeen " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
	       			8) echo  "eighteen "
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;; 
	       			9) echo  "nineteen " 
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
				0) echo  "ten "
					i=$(( $i + 1 ))
					len=$(( $len - 2 ))
					;;
			esac
		else
			case $digit in					
				2) echo -n "twenty " 
					break
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
				3) echo -n "thirty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
	       			4) echo -n "fourty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
	       			5) echo -n "fifty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
				6) echo -n "sixty " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
				7) echo -n "seventy " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
	       			8) echo -n "eighty "
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;; 
	       			9) echo -n "ninety " 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
				0) 
					i=$(( $i + 1 ))
					len=$(( $len - 1 ))
					;;
			esac
		fi
	fi
	if [ $len -eq 1 ]
	then
		digit=$(echo $n | cut -c $i)
		case $digit in
			1) echo  "one "
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;	
        		2) echo  "two " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
        		3) echo  "three " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
       			4) echo  "four " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
       			5) echo  "five " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
        		6) echo  "six " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
        		7) echo  "seven " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
       			8) echo  "eight "
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;; 
       			9) echo  "nine " 
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;
			0) echo  ""	
				i=$(( $i + 1 ))
				len=$(( $len - 1 ))
				;;		
		esac
	fi			
done
