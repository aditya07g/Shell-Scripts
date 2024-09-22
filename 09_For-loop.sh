#!/bin/bash

for i in 1 2 3 4 
do
    echo "Number is $i"
done

echo "--------------------------------"

for i in {1..9}
do
    echo "Number is $i"
done

echo "--------------------------------"

for i in string1 string2 string3
do
    echo "String is $i"
done

namelist="/d/AWS/Name.txt"
for i in $(cat $namelist)
do 
    echo " names list from file: $i"
done

array=(1 2 30.5 hi "hello string")
length=${#array[*]}
for (( i=0;i<$length;i++ ))
do 
    echo "Printing Array values: ${array[i]}"
done