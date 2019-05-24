#!/bin/bash

#Script to read sturcture of the database and create corresponding collections

#Connecting to MySQL server and extracting all table names from first column of the show tables command 
line=$(mysql -h localhost -u <name> -p<password> -e "show tables from cs18204398;" | awk 'FNR>=2{print $1}')

#Loop to iterate through each table name and creating a corresponding collection in MongoDB
for i in $line
do 
mongo cs18204398_as1 --eval 'db.createCollection("'"${i}"'");'
done

echo "MongoDB Collections created successfully"
