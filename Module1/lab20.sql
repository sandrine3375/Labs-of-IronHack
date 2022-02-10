CREATE DATABASE lab19;
USE lab19;
CREATE TABLE CARS 
(
	VIN  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    manufacturer VARCHAR(50),
    Model VARCHAR(50),
    Year date,
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
    date datetime,
    VIN  INT,
    FOREIGN KEY(VIN) REFERENCES cars(VIN),
    Costumerid INT,
    FOREIGN KEY(costumerid) REFERENCES customers(costumerid),
    staffid int, 
    FOREIGN KEY(staffid) REFERENCES salespersons(staffid)
       );
   

