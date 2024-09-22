#!/bin/bash

#Arrays in BASH

myArray=(1 2 hello "Your String" 20.5 lastvalue)


echo "Printing all values of array ${myArray[*]}"
echo "Printing value at index 3 ${myArray[3]}"
echo "Printing length of array ${#myArray[*]}"
echo "Printing specific value from index 2 ${myArray[*]:2}"
echo "Printing particular range of array from index to next 3 values inside array ${myArray[*]:2:3}"

#Update an array

myArray+=( 5 6 8 )
echo "Printing all values of updated array ${myArray[*]}"

#Declare an array (For key value pairs)

declare -A myNewArray
myNewArray=( [name]=Reptile [age]=20 )

echo "Printing Name from Key Value pair array: ${myNewArray[name]}"