#!/bin/bash
#Caroline Tang (20115082) - Assignment 4 Part 2
echo "Enter the first value of the sequence"
read var1
echo "Enter the last value of the sequence"
read var2

for i in $(seq $var1 $var2)
do
  if [ $i -lt 10 ]
  then
    echo "$i is a single-digit number"
  else
    echo "$i is a double-digit number"
  fi
done

