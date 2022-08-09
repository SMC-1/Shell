#!/bin/bash -u
PATH=/bin:/usr/bin ; export PATH
umask 022

x=$1
y=$2

echo "$USER the answer for $1 + $2 is $((x + y))"
echo "$USER the answer for $1 - $2 is $((x - y))"
echo "$USER the answer for $1 * $2 is $((x * y))"
echo "$USER the answer for $1 / $2 is $((x / y))"
echo "$USER the answer for $1 % $2 is $((x % y))"

