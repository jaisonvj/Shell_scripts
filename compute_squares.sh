#!/bin/bash
#filename:compute_squares
int=1
echo "Now compute squares from 1 to 10:"
until [ $int -gt 10 ]
do
	sq=`expr $int \* $int`
	echo -n "$int's square is "
	echo $sq
	int=`expr $int + 1`
done
echo "Job completed!"
