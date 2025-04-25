/*1. List all managers’ names, their salary, and bonus (if any).
 Show full name as one column. */
 CREATE OR REPLACE VIEW allManagers AS
 SELECT mfname, mlname, mbdate, msalary, mbonus
 FROM Manager;
/*2.Find the names of all managers who manage more than one building. */
CREATE OR REPLACE VIEW MANAGE_MORE_ONE_BUILDING AS
SELECT m.mfname,m.mlname
FROM Manager m
JOIN Building B ON M.managerid=B.bmanagerid
GROUP BY m.managerid,M.mfname,M.mlname
HAVING COUNT(B.buildingid)>1;

/*3. List each building's ID and the number of apartments in it.  */
CREATE OR REPLACE VIEW appartments_in_buildings AS
SELECT buildingid, COUNT(aptno)
FROM Apartment
GROUP BY buildingid;

/*4.Display the names of staff members who cleaned at least 2 different apartments. */
CREATE OR REPLACE VIEW staff_names_2_appt AS
SELECT S.smembername
FROM StaffMember S
JOIN Cleaning C ON S.smemberid=C.smemberid
GROUP BY S.smembername
HAVING COUNT(C.smemberid)>=2;

/*5. Show the names of all managers who reside in a building they also manage. */
CREATE OR REPLACE VIEW reside_and_manaaage AS
SELECT M.mfname, M.mlname,M.mresbuildingid
FROM Manager M
JOIN Building B ON M.managerid = B.bmanagerid
WHERE M.mresbuildingid =B.buildingid;
/*6. List the names of all corporate clients who referred other clients. */
CREATE OR REPLACE VIEW refered_other_clients AS
SELECT ccname
FROM CorpClient 
WHERE ccidreferredby IS NOT NULL;
/*7.For each inspector, show the number of unique buildings they have inspected. */
CREATE OR REPLACE VIEW number_of_expected_buildings AS
SELECT I.insid, I.insname,COUNT(DISTINCT ING.buildingid)
FROM Inspector I
RIGHT JOIN Inspecting ING ON I.insid=ING.insid
gROUP BY I.insid, I.insname;

/*8. Show the names of inspectors who have inspected all buildings managed by manager 'M23'. */
CREATE OR REPLACE VIEW m23_and_inspectors AS
SELECT i.insid, i.insname
FROM Inspector i
WHERE NOT EXISTS (
  SELECT 1
  FROM Building b
  WHERE b.bmanagerid = 'M23'
    AND NOT EXISTS (
      SELECT 1
      FROM Inspecting ing
      WHERE ing.insid = i.insid
        AND ing.buildingid = b.buildingid
    )
);

/*9.List apartments (building ID and apartment number) which have not been assigned to any corporate client. */
CREATE OR REPLACE VIEW not_assigned_to_client AS
SELECT buildingid, aptno
FROM Apartment
WHERE ccid IS NULL;
/* */
/* */
/* */
/* */
/* */
/* */
/* */
lab7_q4


lab7_q5


lab7_q6


lab7_q7


lab7_q8


lab7_q9


lab7_q10
Find all managers who do not manage any building.

lab7_q11
Show building IDs that have been inspected by more than one inspector.

lab7_q12
Display each corporate client’s name and the number of apartments they occupy.

lab7_q13
Show staff members who have cleaned apartments in multiple buildings.

lab7_q14
List apartment numbers and their buildings cleaned by Boris (staff member).

lab7_q15
List all inspectors who inspected buildings with more than 4 floors.

lab7_q16
Find corporate clients whose apartments have never been cleaned.