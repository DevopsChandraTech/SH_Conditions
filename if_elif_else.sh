#!/bin/bash
#print which number is greater and less and equal to 10
#shell script is depending on commonsense

NUMBER=$1
if [ $NUMBER -lt 10 ]; then
    echo "given number $NUMBER lessthan 10"
elif [ $NUMBER -eq 10 ]; then
    echo "given number $NUMBER is 10"
else
    echo "given number $NUMBER is greaterthan 10"
fi
#even or odd numbers

if [ "$NUMBER % 2" -eq 0 ]; then
    echo "given number $NUMBER is even"
else 
    echo "given number $NUMBER is odd"
fi