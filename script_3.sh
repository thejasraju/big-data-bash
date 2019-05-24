#!/bin/bash

#Script to estimate time taken to execute query in both the database management systems

START_TIME1=$(date +%s)

mysql -h localhost -u <name> -p<password> cs18204398 -e "use cs18204398; select * from titles where emp_no=10014;"

END_TIME1=$(date +%s)

START_TIME2=$(date +%s)

mongo cs18204398_as1 --eval 'db.titles.find({"emp_no":10014});'

END_TIME2=$(date +%s)

START_TIME3=$(date +%s)

mysql -h localhost -u <name> -p<password> cs18204398 -e 'select sum(salary) "TotalAmount" from salaries'

END_TIME3=$(date +%s)

START_TIME4=$(date +%s)

mongo cs18204398_as1 --eval 'db.salaries.aggregate( { $group: { _id : null, Amount : { $sum : "$salary" } } });'

END_TIME4=$(date +%s)

echo "Time taken to execute simple MySQL query:$(($END_TIME1-$START_TIME1))"

echo "Time taken to execute simple MongoDB query:$(($END_TIME2-$START_TIME2))"

echo "Time taken to execute complex MySQL query:$(($END_TIME3-$START_TIME3))"

echo "Time taken to execute complex MongoDB query:$(($END_TIME4-$START_TIME4))"

