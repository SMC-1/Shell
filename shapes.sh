#!/bin/bash
PATH=/bin:usr/bin ; export PATH
umask 022
#Script Shapes version 1
#Santiago Mesa 041044858 mesa0012@algonquinlive.com

#check incorrect number of arguments
if [[ $# > 3 ]]; then
	echo "Incorrect number of arguments." 1>&2
	exit 1
fi

#declare variables according to user input
shape=$1
size=$2

case $shape in 
	square)
		for (( i=0; i<$size; i++ ))
		do
			for (( j=0; j<$size; j++ ))
			do	
				#check if there is a sybol in the input
				if [[ $# -eq 3 ]];then
					echo -n "$3"
				#print * by default
				else
					echo -n "*"
				fi
			done
		echo ""
		done;;
	line)
		for (( i=0; i<$size; i++ ))
		do
			#check if there is a symbol to print
			if [[ $# -eq 3 ]];then
                                        echo -n "$3"
				#print * by defaullt
                                else
                                        echo -n "*"
                                fi
		done
		echo "";;
	triangle)
		for (( i=1; i<=$size; i++ ))
		do
			for (( j=0; j<i; j++ ))
			do
				#check if there is a symbol to print
				if [[ $# -eq 3 ]];then
                                        echo -n "$3"
                                #print * by default
				else
                                        echo -n "*"
                                fi
			done
		echo ""
		done;;

	*)	#any other output 
		echo "invalid output: $1 not recognized" 1>&2
		exit 1
esac
