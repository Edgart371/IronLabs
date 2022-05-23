CREATE DATABASE if not exists lab_mysql;
USE lab_mysql;
CREATE TABLE Cars(
   ID INT AUTO_INCREMENT,
   VIN VARCHAR(20),
   Manufacturer VARCHAR(20),
   Model VARCHAR(20),
   Year YEAR,
   COLOR VARCHAR (20),
   PRIMARY KEY (ID));
   
CREATE TABLE Salespersons(
	ID INT AUTO_INCREMENT,
    Staff_ID FLOAT,
    Name VARCHAR(20),
    Store VARCHAR(20),
    PRIMARY KEY (ID));
    
CREATE TABLE Customers(
	ID INT AUTO_INCREMENT,
    Customer_ID FLOAT,
    Name VARCHAR(20),
    Phone VARCHAR(20),
    Email VARCHAR(20),
    Address VARCHAR(40),
    City VARCHAR(20),
    State_Province VARCHAR(20),
    Country VARCHAR(20),
    Postal FLOAT,
    ID_Staff FLOAT,
    PRIMARY KEY (ID)
    );
    #ForeinKEY ID_Staff!
CREATE TABLE Invoices(
ID INT AUTO_INCREMENT,
Invoice_Number FLOAT,
DATE VARCHAR(20),
CAR VARCHAR(20),
Customer_ID FLOAT,
Staff_ID FLOAT,
PRIMARY KEY (ID)
);