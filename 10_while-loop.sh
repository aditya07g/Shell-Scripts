#!/bin/bash

# while true
# do 
#     echo "Hi"
#     sleep 2s
# done

count=1
number=5

while [ $count -le $number ]
do
    echo "Numbers are: $count"
    let count++
done

a=5

until [ $a -eq 1 ]
do
    echo "Until Numbers are: $a"
    a=`expr $a - 1`
    # let a--
done