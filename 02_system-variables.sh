#!/bin/bash
# Printing System-Defined variables

echo "$BASH"
echo '$BASH'
NewValue=$(PWD)
echo "Printing Current working directory $NewValue"

echo "Printing Home Directory $HOME"

echo "printing LogName $LOGNAME"

echo "printing OSTYPE $OSTYPE"

echo "Printing USERNAME $USERNAME"
 
Listfiles=$(ls)
echo "Printing Files available in this directory:: $Listfiles"

DATE=$(date)
echo "Printing date: $DATE"

 