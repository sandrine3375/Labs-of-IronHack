CREATE DATABASE lab19;
USE lab19;
CREATE TABLE CARS 
(
	VIN  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    manufacturer VARCHAR(50),
    Model VARCHAR(50),
    Year int,
    color varchar(30) 
  );
CREATE TABLE CUSTOMERS 
(
	Costumerid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(50),
    phonenumber bigint,
    adress varchar(50) 
  );
  CREATE TABLE Salespersons 
(
	Staffid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    store VARCHAR(50) 
  );
  

 CREATE TABLE Invoices
(	Invoiceid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date int,
    VIN  INT,
    FOREIGN KEY(VIN) REFERENCES cars(VIN),
    Costumerid INT,
    FOREIGN KEY(costumerid) REFERENCES customers(costumerid),
    staffid int, 
    FOREIGN KEY(staffid) REFERENCES salespersons(staffid)
       );       

ALTER TABLE cars change year year1 int (17);
 


INSERT INTO cars
VALUES (3,	"Volkswagen",	"Tiguan",	2019,	"Blue");

INSERT INTO customers
VALUES (10001,	"Pablo Picasso", "dddf@gmail.com", 	0034636176382, "Paseo de la Chopera");

INSERT INTO salespersons
VALUES (00001,	"Petey Cruiser","Madrid");

INSERT INTO invoices
VALUES (852399038,	2018, (SELECT VIN from Cars  WHERE VIN='3'), 
(SELECT costumerid from lab19.customers WHERE costumerid='10001'), 
(SELECT staffid from lab19.salespersons WHERE staffid='00001'));


 

