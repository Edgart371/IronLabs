CREATE DATABASE if not exists lab_mysql;
USE lab_mysql;
#Deleter row 5, because the ID starte with 1 and not 0
DELETE FROM Cars WHERE ID = '5';
select * from Cars;