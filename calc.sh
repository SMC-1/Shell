#!/bin/bash -u
PATH=/bin:/usr/bin ; export PATH
umask 022

x=$1
op=$2
y=$3

if [[ $# -eq 3 ]]; then 
	case $op in
		+) echo "$USER the answer for $x + $y is $((x + y))";;
		-) echo "$USER the answer for $x - $y is $((x - y))";;
		'*') echo "$USER the answer for $x * $y is $((x * y))";;
		/) if [[ $op == / && $3 == 0 ]]; then
			echo "Cannot divide by zero" 1>&2
			exit 1
		else  echo "$USER the answer for $x / $y is $((x / y))";
		fi;;
		%) echo "$USER the answer for $x % $y is $((x % y))";;
		*) echo "Unrecognized operand" 1>&2
			exit 1
	esac
else echo "Need to input only 3 arguments." 1>&2;
	exit 1
fi

