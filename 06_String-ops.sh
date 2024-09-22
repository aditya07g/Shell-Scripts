#!/bin/bash

#String operations

myVar="Hello Buddy!, How Are you?"

length=${#myVar}
echo  "Print Length: $length" 
upper=${myVar^^}
echo  "Print Upercase: $upper"
lower=${myVar,,}
echo  "Print Lowercase: $lower"
replace=${myVar/Buddy/Reptile}
echo  "Print replaced string: $replace" 
slice=${myVar:6:11}
echo  "Print after slice string: $slice"

echo "Final String $myVar"