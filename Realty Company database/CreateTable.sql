CREATE DATABASE Realty_Company_DB2;
USE Realty_Company_DB2;
CREATE TABLE Manager (
 managerid CHAR(4) NOT NULL,
 mfname VARCHAR(15) NOT NULL,
 mlname VARCHAR(15) NOT NULL,
 mbdate DATE NOT NULL,
 msalary NUMERIC (9,2) NOT NULL,
 mbonus NUMERIC (9,2),
 mresbuildingid CHAR(3),
 PRIMARY KEY (managerid) 
 );

CREATE TABLE ManagerPhone (
 managerid CHAR(4) NOT NULL,
 mphone CHAR(11) NOT NULL,
 PRIMARY KEY (managerid, mphone),
 FOREIGN KEY (managerid) REFERENCES manager(managerid)
 );

CREATE TABLE Building ( 
 buildingid CHAR(3) NOT NULL,
 bnooffloors INT NOT NULL,
 bmanagerid CHAR(4) NOT NULL,
 PRIMARY KEY (buildingid),
 FOREIGN KEY (bmanagerid) REFERENCES
 manager(managerid)
 );

CREATE TABLE Inspector (
 insid CHAR(3) NOT NULL,
 insname VARCHAR(15) NOT NULL,
 PRIMARY KEY (insid)
 );

CREATE TABLE Inspecting (
 insid CHAR(3) NOT NULL,
 buildingid CHAR(3) NOT NULL,
 datelast DATE NOT NULL,
 datenext DATE NOT NULL,
 PRIMARY KEY (insid, buildingid),
 FOREIGN KEY (insid) REFERENCES inspector(insid),
 FOREIGN KEY (buildingid) REFERENCES
 building(buildingid)
 );

CREATE TABLE CorpClient (
 ccid CHAR(4) NOT NULL,
 ccname VARCHAR(25) NOT NULL,
 ccindustry VARCHAR(25) NOT NULL,
 cclocation VARCHAR(25) NOT NULL,
 ccidreferredby CHAR(4),
 PRIMARY KEY (ccid),
 UNIQUE (ccname),
 FOREIGN KEY (ccidreferredby) REFERENCES
 corpclient(ccid)
 ); 

CREATE TABLE Apartment (
 buildingid CHAR(3) NOT NULL,
 aptno CHAR(5) NOT NULL,
 anoofbedrooms INT NOT NULL,
 ccid CHAR(4),
 PRIMARY KEY (buildingid, aptno),
 FOREIGN KEY (buildingid) REFERENCES
 building(buildingid),
 FOREIGN KEY (ccid) REFERENCES corpclient(ccid)
 );


CREATE TABLE StaffMember (
 smemberid CHAR(4) NOT NULL,
 smembername VARCHAR(15) NOT NULL,
 PRIMARY KEY (smemberid)
 );


CREATE TABLE Cleaning (
  buildingid CHAR(3) NOT NULL,
  aptno CHAR(5) NOT NULL,
  smemberid CHAR(4) NOT NULL,
  PRIMARY KEY (buildingid, aptno, smemberid),
  FOREIGN KEY (buildingid, aptno)
    REFERENCES Apartment(buildingid, aptno)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
