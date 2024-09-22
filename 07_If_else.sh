#!/bin/bash

#If-Else Condition

read -p "Enter your Age: " age

if [[ $age -gt 18 ]]
then
    echo "You can Vote"
else
    echo "You can't Vote"
fi