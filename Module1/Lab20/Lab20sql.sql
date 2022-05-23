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
#FOREIGN KEY (FR_VIN) REFERENCES Cars(VIN), FOREIGN KEY (ID_Customer) REFERENCES Customers(Customer_ID), FOREIGN KEY (ID_Staff) REFERENCES Salespersons(Staff_ID)

INSERT INTO Cars(VIN, Manufacturer, Model, year, COLOR)
VALUES ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', 'Blue'),
('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', '2019', 'Red'), 
('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', '2018', 'White'),
('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', '2018', 'Silver'),
('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019', 'Gray'),
('DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', '2019', 'Gray');
select * from Cars;

INSERT INTO Customers (Customer_ID, Name, Phone, Email, Address, City, State_Province, Country, Postal)
VALUES ('10001', 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045'),
('20001', 'Abraham Lincoln', '+1 305 907 7086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130'), 
('30001', 'Napoléon Bonaparte', '+33 1 79 75 40 00', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');
select * from Customers;

INSERT INTO Salespersons (Staff_ID, Name, Store)
VALUES ('00001', 'Petey Cruiser', 'Madrid'),
('00002', 'Anna Sthesia', 'Barcelona'),
('00003','Paul Molive', 'Berlin'),
('00004', 'Gail Forcewind', 'Paris'),
('00005', 'Paige Turner', 'Mimia'),
('00006', 'Bob Frapples', 'Mexico City'),
('00007', 'Walter Melon', 'Amsterdam'),
('00008', 'Shonda Leer', 'São Paulo');
select * from Salespersons;

INSERT INTO Invoices (Invoice_Number, DATE, CAR, Customer_ID, Staff_ID)
VALUES ('852399038', '22-08-2018', '0', '1', '3'),
('731166526', '31-12-2018', '3', '0', '5'),
('271135104', '22-01-2019', '2', '2', '7');
 select * from Invoices;