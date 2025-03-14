Create database CompanyDb;

USE CompanyDB;
Create TABLE Company(

SSN INT PRIMARY KEY,
FName VARCHAR(15) nULL,
MInit CHAR (1),
LName VARCHAR(25) NOT NULL,
Salary DECIMAL (8,2) CHECK (Salaary > 0),
BirthDate Date,
Address Varchar(100)
);
 
 DROP TABLE Employee;
 SELECT  *
 From EMployee;

INSERT INTO Employee VALUES (111,'Saeed', ' ', 'Mirjalili', 1000, '2007/01/01', 'New Westminister');
INSERT INTO Employee VALUES (111,'Mike', ' ', 'Mirjalili', 1000, '2007/01/01', 'New Westminister');
INSERT INTO Employee VALUES (111,'John', ' ', 'Mirjalili', 1000, '2007/01/01', 'New Westminister');