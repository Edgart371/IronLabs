CREATE DATABASE if not exists lab_mysql;
USE lab_mysql;

UPDATE Salespersons
SET Store = "Miami"
WHERE Store = "Mimia";
select * from Salespersons;

UPDATE Customers
SET Email = "ppicasso@gmail.com"
WHERE Customer_ID = "10001";
UPDATE Customers
SET Email = "lincoln@us.gov"
WHERE Customer_ID = "20001";
UPDATE Customers
SET Email = "hello@napoleon.me"
WHERE Customer_ID = "30001";
select * from Customers;