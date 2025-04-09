CREATE DATABASE CompanyDb;

USE CompanyDB;

CREATE TABLE Employee (
    SSN INT PRIMARY KEY,
    FName VARCHAR(15) DEFAULT NULL,
    MInit CHAR(1) DEFAULT NULL,
    LName VARCHAR(25) NOT NULL,
    Salary DECIMAL(8,2) CHECK (Salary > 0),
    BirthDate DATE,
    Address VARCHAR(100)
);

-- Drop table if needed (though unnecessary after creation)
-- DROP TABLE Employee;

-- Selecting from Employee (only works after inserting data)
SELECT * FROM Employee;

-- Inserting unique values to avoid duplicate SSN errors
INSERT INTO Employee VALUES (111, 'Saeed', NULL, 'Mirjalili', 1000, '2007-01-01', 'New Westminster');
INSERT INTO Employee VALUES (112, 'Mike', NULL, 'Smith', 1500, '1995-05-10', 'Burnaby');
INSERT INTO Employee VALUES (113, 'John', 'D', 'Doe', 2000, '1988-09-20', 'Vancouver');


INSERT INTO Employee (SSN, FName, LName) VALUES (117, 'jack','Smith');

DELETE FROM Employee
WHERE FName = 'Saeed' AND SSN = 111;

UPDATE Employee
SET BirthDate = '2010/12/12'
WHERE SSN = 113;

SELECT SSN, Salary, Salary *0.5 AS HalfSalary
From Employee
Where HalfSalary >0.5;