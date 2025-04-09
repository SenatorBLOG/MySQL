USE StudentCLUB_Database;
/* 1. Display all members of the database*/
CREATE OR REPLACE VIEW  databaseMembers AS
SELECT *
FROM Member;

/* 2. Display students with GPA above 3,5. Sort by GPA.*/
CREATE OR REPLACE VIEW studentGpaSort AS
SELECT 
M.FullName AS Full_Name, 
S.CourseName AS Course_Name, 
S.GPA
FROM Member M 
INNER JOIN Student S ON M.SSN = S.SSN
WHERE S.GPA > 3.5
ORDER BY S.GPA DESC;


/* 3. Retrieve CLub Name and Group Name that have been enrolled by at least one student.*/
CREATE OR REPLACE VIEW enrolmentStatus AS
SELECT DISTINCT 
M.FullName AS Full_Name,
C.ClubName AS Club_Name,
G.GroupName AS Group_Name
FROM Member M 
INNER JOIN MemberGroupMembership MGM ON MGM.SSN = M.SSN
INNER JOIN Clubs C ON C.ClubID = MGM.ClubID
INNER JOIN `Groups` G ON G.GroupID = MGM.GroupID;


/*4. Display ClubID, ClubName, and MembershipStart of all alumni 
(no matter if a alumni has enrolled in that section or not) and 
the name of students who enrolled in that club */
CREATE OR REPLACE VIEW alumniMembStart AS
SELECT DISTINCT 
    M.FullName AS Full_Name, MGM.ClubId AS Club_ID, 
    C.ClubName AS Club_Name,
    MGM.MembershipStart AS Membership_Start
FROM Member M
    INNER JOIN Alumni A ON A.SSN = M.SSN
	LEFT JOIN MemberGroupMembership MGM ON M.SSN = MGM.SSN
    LEFT JOIN Clubs C ON C.ClubId = MGM.ClubId;

/* 5. Display the name of all students 
(no matter if they have enrolled in any group) 
and the group ID of group name that they have enrolled. */
CREATE OR REPLACE VIEW studentsEnrolmentStatus AS
SELECT DISTINCT
M.FullName AS Full_Name,
G.GroupName AS Group_Name,
G.GroupID AS Group_id
FROM Member M
	INNER JOIN Student S ON S.SSN=M.SSN
	LEFT JOIN MemberGroupMembership MGM ON M.SSN = MGM.SSN
    LEFT JOIN `Groups` G ON G.GroupID = MGM.GroupID
ORDER BY M.FullName;

/*6. Display Alumnies who worked for more than 1 company. */
CREATE OR REPLACE VIEW alumniMoreThan1 AS
SELECT DISTINCT
A.SSN AS Alumni_SSN,
M.FullName AS Full_Name,
COUNT(*) AS Number_of_Companies
FROM Alumni A
INNER JOIN Member M ON M.SSN = A.SSN
LEFT JOIN AlumniWorkHistory AWH ON AWH.SSN =  A.SSN
GROUP BY A.SSN
HAVING COUNT(*)>1;



/* 7. Retrieve all members who recived payments for the projects
 and their payment amount bigger than 200.*/
CREATE OR REPLACE VIEW memberRecivedPayment AS
SELECT DISTINCT 
M.SSN AS Member_SSN,
M.FullName AS Full_Name,
MPP.PaymentAmount AS Payment_Amount
FROM Member M 
INNER JOIN MemberProjectPayments MPP ON MPP.SSN = M.SSN
WHERE MPP.PaymentAmount >200;

/* 8. Display total budget of each club's projects*/
CREATE OR REPLACE VIEW totalClubsBudget AS
SELECT
C.ClubName AS ClubName,
SUM(FP.TotalBudget) AS Total_Budget
FROM Clubs C
INNER JOIN ClubsGroupsFundedProjects CGFP ON CGFP.ClubID = C.ClubID
INNER JOIN FundedProjects FP ON FP.ProjectID = CGFP.ProjectID
GROUP BY C.ClubName;

/* 9. Display projects with the highest budget among all clubs. */
CREATE OR REPLACE VIEW highestClubsBudget AS
SELECT 
C.ClubName, 
FP.ProjectFunction,
FP.TotalBudget
FROM FundedProjects FP
JOIN ClubsGroupsFundedProjects CGFP ON FP.ProjectID = CGFP.ProjectID
JOIN Clubs C ON C.ClubID = CGFP.ClubID
WHERE FP.TotalBudget = (
    SELECT MAX(TotalBudget) FROM FundedProjects
);

/* 10. Display amount of students in each club and their
 average GPA, including those who do not have a GPA*/
CREATE OR REPLACE VIEW averageGpa AS
SELECT 
C.ClubName,
COUNT(DISTINCT MGM.SSN) AS Total_Students,
ROUND(AVG(S.GPA), 2) AS Avg_GPA
FROM Clubs C
LEFT JOIN MemberGroupMembership MGM ON C.ClubID = MGM.ClubID
LEFT JOIN Student S ON S.SSN = MGM.SSN
GROUP BY C.ClubName;

/* 11. Display time of the next coming event 
with alumni that is going to attend.*/
CREATE OR REPLACE VIEW eventTime AS
SELECT 
A.SSN,
E.EventTime,
E.EventDate
FROM Alumni A 
INNER JOIN MemberGroupMembership MGM ON A.SSN = MGM.SSN
INNER JOIN ClubsGroupsEvents CGE ON MGM.ClubId = CGE.ClubId
INNER JOIN Events E ON E.EventId = CGE.EventId;

/* 12. Retrieve the name of all students who went to 'Aztec Dance Fest'. */
CREATE OR REPLACE VIEW wentAztecDanceFest AS
SELECT
  S.SSN AS Student_SSN,
  M.FullName AS Full_Name
FROM Member M
INNER JOIN Student S ON M.SSN = S.SSN
INNER JOIN MemberGroupMembership MGM ON S.SSN = MGM.SSN
INNER JOIN ClubsGroupsEvents CGE 
    ON MGM.ClubID = CGE.ClubID AND MGM.GroupID = CGE.GroupID
INNER JOIN Events E ON E.EventID = CGE.EventID
WHERE E.Subject LIKE '%Aztec Dance Fest%';

/* 13. Display the last registration time*/
CREATE OR REPLACE VIEW lastRegistraationTime AS
SELECT 
LocID, MAX(EventDate) AS Last_Event
FROM Events
GROUP BY LocID;

/* 14. Display number of members for every project.*/
CREATE OR REPLACE VIEW membersNumber AS
SELECT 
FP.ProjectFunction, 
COUNT(MPP.SSN) AS Num_Members
FROM FundedProjects FP
JOIN MemberProjectPayments MPP ON FP.ProjectID = MPP.ProjectID
GROUP BY FP.ProjectID;

/* 15. Display alumni with the most recent work history.*/
CREATE OR REPLACE VIEW alumni_Recent_History AS
SELECT 
A.SSN AS Alumni_SSN,
M.FullName AS Full_Name,
AWH.CompanyName, 
AWH.JobTitle,
AWH.StartDate
FROM Member M 
INNER JOIN Alumni A  ON M.SSN = A.SSN
INNER JOIN AlumniWorkHistory AWH ON AWH.SSN = A.SSN
WHERE AWH.StartDate = (
	SELECT MAX(StartDate) 
    FROM AlumniWorkHistory
    WHERE SSN = A.SSN);

/* 16. Display location of the last event.*/
CREATE OR REPLACE VIEW last_event_Location AS
SELECT 
L.RoomNumber AS Room_Number,
L.FloorNumber AS Floor_Number,
L.BuildingName AS Building_Name,
E.EventDate
FROM Location L
LEFT JOIN Events E ON L.LocID = E.LocID
WHERE E.EventDate = (
	SELECT MAX(EventDate) FROM Events);

/* 17. Retrieve the GroupID and the number of students in those groups.*/
CREATE OR REPLACE VIEW number_in_Groups AS
SELECT
GroupID AS Group_id,
COUNT(SSN) AS Students_Number
FROM MemberGroupMembership
GROUP BY GroupID;

/* 18. Retrieve the name of the student who have joined tech groups*/
CREATE OR REPLACE VIEW names_in_tech_group AS
SELECT
M.FullName AS Full_Name,
G.GroupName AS Group_Name
FROM Member M 
INNER JOIN MemberGroupMembership MGM ON M.SSN = MGM.SSN
INNER JOIN `Groups` G ON  MGM.GroupID = G.GroupID
WHERE G.GroupName LIKE '%Tech Titans%';


/* 19. Display all alumnies graduated in Literature.*/
CREATE OR REPLACE VIEW literature_Alumni AS
SELECT
  A.SSN AS Alumni_SSN,
  M.FullName AS Full_Name,
  A.GraduationYear AS Graduation_Year,
  A.DegreeTitle AS Degree_Title,
  A.MajorField AS Major_Field
FROM Alumni A
JOIN Member M ON A.SSN = M.SSN
WHERE A.MajorField = 'Literature';

/* 20. Display student with the next expiring membership.*/
CREATE OR REPLACE VIEW expiring_membership AS
SELECT
  M.SSN AS Member_SSN,
  M.FullName AS Full_Name,
  MGM.MembershipEnd AS Membership_End_Date
  FROM Member M 
  JOIN Student S ON M.SSN = S.SSN
JOIN MemberGroupMembership MGM ON M.SSN = MGM.SSN
WHERE MGM.MembershipEnd IS NOT NULL
ORDER BY MGM.MembershipEnd ASC
LIMIT 1;
  
  
  
  