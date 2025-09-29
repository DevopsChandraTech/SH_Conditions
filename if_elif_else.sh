#!/bin/bash
#print which number is greater and less and equal to 10
#shell script is depending on commonsense

NUMBER=$1
if [ NUMBER -lt 10 ]; then
    echo "given number $1 lessthan 10"
elif [ NUMBER -eq 10 ]; then
    echo "given number is 10"
else;
    echo "given number $1 is greaterthan 10"
fi