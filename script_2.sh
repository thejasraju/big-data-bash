#!/bin/bash

#Script to populate the collections in MongoDB from the MySQL database

#Connecting to MySQL server and extracting all table names from first column of the show tables command 
line=$(mysql -h localhost -u <name> -p<password> -e "show tables from cs18204398;" | awk 'FNR>=2{print $1}')

#Loop to iterate through each table name and populating a corresponding collection in MongoDB
for i in $line
do
#Creating a CSV file of each table content from the MySQL server
line1=$(mysql -h localhost -u <name> -p<password> -e "use cs18204398; select * from $i" )

#Adding tabs in the data
echo "$line1"| tr '\t' ','> output.csv 

#Importing the CSV file to populate the corresponding collections
mongoimport -d cs18204398_as1 -c $i --type csv --file output.csv --headerline

rm output.csv
done

echo "The Collections have been populated"
