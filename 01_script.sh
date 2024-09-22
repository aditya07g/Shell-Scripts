#!/bin/bash


echo "My First Shell Script"

echo "###### Printing Host Name ######"

readonly host=$(hostname) #This variable we use to define a variable constant

echo $host

host="newvalue"

echo $host
