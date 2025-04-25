USE Realty_Company_DB2;
INSERT INTO Manager VALUES ('M12', 'Boris', 'Grant','1980-04-1', 60000, null, null);
INSERT INTO Manager VALUES ('M23', 'Austin', 'Lee', '1975-05-2', 50000, 5000, null);
INSERT INTO Manager VALUES ('M34', 'George', 'Sherman','1978-06-12', 52000, 2000, null);

INSERT INTO ManagerPhone VALUES ('M12', '555-2222');
INSERT INTO ManagerPhone VALUES ('M12','555-3232');
INSERT INTO ManagerPhone VALUES ('M23','555-9988');
INSERT INTO ManagerPhone VALUES ('M34','555-9999');

INSERT INTO Building VALUES ('B1', '5', 'M12');
INSERT INTO Building VALUES ('B2', '6', 'M23');
INSERT INTO Building VALUES ('B3', '4', 'M23');
INSERT INTO Building VALUES ('B4', '4', 'M34');

INSERT INTO Inspector VALUES ('I11', 'Jane');
INSERT INTO Inspector VALUES ('I22', 'Niko');
INSERT INTO Inspector VALUES ('I33', 'Mick');

INSERT INTO Inspecting VALUES ('I11', 'B1', '2016-01-02', '2016-04-02');
INSERT INTO Inspecting VALUES ('I11', 'B2', '2016-08-02', '2016-08-04');
INSERT INTO Inspecting VALUES ('I22', 'B2', '2016-08-02', '2016-08-04');
INSERT INTO Inspecting VALUES ('I22', 'B3', '2016-08-11', '2016-08-02');
INSERT INTO Inspecting VALUES ('I33', 'B3', '2016-08-01', '2016-04-01');
INSERT INTO Inspecting VALUES ('I33', 'B4', '2016-08-11', '2016-08-02');


INSERT INTO CorpClient VALUES ('C111', 'BlingNotes', 'Music', 'Chicago', null);
INSERT INTO CorpClient VALUES ('C222', 'SkyJet', 'Airline', 'Oak Park', 'C111');
INSERT INTO CorpClient VALUES ('C777', 'WindyCT', 'Music', 'Chicago', 'C222');
INSERT INTO CorpClient VALUES ('C888', 'SouthAlps', 'Sports', 'Rosemont', 'C777');

INSERT INTO Apartment VALUES ('B1', '21', 1, 'C111');
INSERT INTO Apartment VALUES ('B1', '41', 1, null);
INSERT INTO Apartment VALUES ('B2', '11', 2, 'C222');
INSERT INTO Apartment VALUES ('B2', '31', 2, null);
INSERT INTO Apartment VALUES ('B3', '11', 2, 'C777');
INSERT INTO Apartment VALUES ('B4', '11', 2, 'C777');

INSERT INTO StaffMember VALUES ('5432', 'Brian');
INSERT INTO StaffMember VALUES ('9876', 'Boris');
INSERT INTO StaffMember VALUES ('7652', 'Caroline');

INSERT INTO cleaning VALUES ('B1', '21', '5432');
INSERT INTO cleaning VALUES ('B1', '41', '9876');
INSERT INTO cleaning VALUES ('B2', '31', '5432');
INSERT INTO cleaning VALUES ('B2', '11', '9876');
INSERT INTO cleaning VALUES ('B3', '11', '5432');
INSERT INTO cleaning VALUES ('B4', '11', '7652'); 