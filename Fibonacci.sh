#!/bin/bash
#
#Print the top 10 number of Fibonacci array
#
echo "Fibonacci Array:"
a_2=0
a_1=1
a=1
for ((i=1;i<=10;i++))
do
	if [ $i -eq 1 ];then
		echo "a[1]=$a_2"
	elif [ $i -eq 2 ];then
		echo "a[2]=$a_1"
	else
		echo "a[$i]=$a"
		a_2=$a_1
		a_1=$a
		a=$((a_1+a_2))
	fi
done
