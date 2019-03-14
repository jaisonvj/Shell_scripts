#!/bin/sh
#
# Script to see whether argument is positive or negative
#
if [ $# -eq 0 ]
then
echo "$0 : You must give/supply one integer"
exit 1
fi

if test $1 -ge 0
then
echo "Number $1 is positive"
else
echo "Number $1 is negative"
fi
