/* The entire code works perfectly on MS SQL Server */

/* 1. Member */
INSERT INTO Member (SSN, FullName, Age, StreetAddress) VALUES
('123-45-6789', 'Aarav Patel', 25, '12 Lotus Lane, Mumbai'),
('987-65-4321', 'Bjorn Svensson', 30, '45 Viking Rd, Stockholm'),
('456-78-9012', 'Zuri Mwangi', 22, '7 Savanna St, Nairobi'),
('321-54-9876', 'Xochitl Quetzal', 28, '19 Aztec Ave, Mexico City'),
('789-12-3456', 'Ksenia Volkova', 35, '33 Snowy Path, Moscow');

/* 2. Student */
INSERT INTO Student (SSN, CourseName, GPA) VALUES
('123-45-6789', 'Advanced Python', 3.8),
('987-65-4321', 'Nordic Literature', 3.5),
('456-78-9012', 'Wildlife Biology', 4.0),
('321-54-9876', 'Aztec History', 3.2),
('789-12-3456', 'Quantum Physics', 3.9);

/* 3. Alumni */
INSERT INTO Alumni (SSN, GraduationYear, DegreeTitle, MajorField) VALUES
('123-45-6789', 2020, 'B.Sc.', 'Computer Science'),
('987-65-4321', 2018, 'M.A.', 'Literature'),
('456-78-9012', 2021, 'B.Sc.', 'Biology'),
('321-54-9876', 2019, 'B.A.', 'History'),
('789-12-3456', 2017, 'Ph.D.', 'Physics');

/* 4. Clubs */
INSERT INTO Clubs (ClubID, ClubName, LeaderSSN) VALUES
(1, 'Cosmic Explorers', '789-12-3456'),
(2, 'Wildlife Warriors', '456-78-9012'),
(3, 'Code Ninjas', '123-45-6789'),
(4, 'Viking Saga Club', '987-65-4321'),
(5, 'Aztec Dance Society', '321-54-9876');

/* 5. Groups */
INSERT INTO `Groups` (GroupID, GroupName) VALUES
(1, 'Stargazers'),
(2, 'Eco Guardians'),
(3, 'Tech Titans'),
(4, 'Story Weavers'),
(5, 'Rhythm Keepers');

/* 6. ClubGroups */
INSERT INTO ClubGroups (ClubID, GroupID) VALUES
(1, 1), -- Cosmic Explorers + Stargazers
(2, 2), -- Wildlife Warriors + Eco Guardians
(3, 3), -- Code Ninjas + Tech Titans
(4, 4), -- Viking Saga Club + Story Weavers
(5, 5); -- Aztec Dance Society + Rhythm Keepers

/* 7. Location */
INSERT INTO Location (LocID, RoomNumber, FloorNumber, BuildingName) VALUES
(1, 'A-101', 1, 'Science Hall'),
(2, 'B-305', 3, 'Eco Tower'),
(3, 'C-12', 2, 'Tech Pavilion'),
(4, 'D-204', 2, 'Arts Center'),
(5, 'E-01', 1, 'Cultural Hub');

/* 8. Events */
INSERT INTO Events (EventID, EventDate, EventTime, Subject, RegistrationFee, LocID) VALUES
(1, '2025-04-15', '18:00:00', 'Star Gazing Night', 10.00, 1),
(2, '2025-05-01', '14:00:00', 'Save the Savanna', 5.00, 2),
(3, '2025-06-10', '10:00:00', 'Hackathon 2025', 15.00, 3),
(4, '2025-07-20', '16:00:00', 'Saga Storytelling', 0.00, 4),
(5, '2025-08-05', '19:00:00', 'Aztec Dance Fest', 8.50, 5);

/* 9. ClubsGroupsEvents */
INSERT INTO ClubsGroupsEvents (ClubID, GroupID, EventID) VALUES
(1, 1, 1), -- Cosmic Explorers + Stargazers + Star Gazing Night
(2, 2, 2), -- Wildlife Warriors + Eco Guardians + Save the Savanna
(3, 3, 3), -- Code Ninjas + Tech Titans + Hackathon 2025
(4, 4, 4), -- Viking Saga Club + Story Weavers + Saga Storytelling
(5, 5, 5); -- Aztec Dance Society + Rhythm Keepers + Aztec Dance Fest

/* 10. FundedProjects */
INSERT INTO FundedProjects (ProjectID, TotalBudget, BudgetPortion, ProjectFunction) VALUES
(1, 5000.00, 20.00, 'Telescope Upgrade'),
(2, 3000.00, 50.00, 'Wildlife Rescue'),
(3, 10000.00, 30.00, 'AI Research Lab'),
(4, 2000.00, 10.00, 'Oral History Archive'),
(5, 4000.00, 25.00, 'Dance Costume Fund');

/* 11. ClubsGroupsFundedProjects */
INSERT INTO ClubsGroupsFundedProjects (ClubID, GroupID, ProjectID) VALUES
(1, 1, 1), -- Cosmic Explorers + Stargazers + Telescope Upgrade
(2, 2, 2), -- Wildlife Warriors + Eco Guardians + Wildlife Rescue
(3, 3, 3), -- Code Ninjas + Tech Titans + AI Research Lab
(4, 4, 4), -- Viking Saga Club + Story Weavers + Oral History Archive
(5, 5, 5); -- Aztec Dance Society + Rhythm Keepers + Dance Costume Fund

/* 12. AlumniWorkHistory */
INSERT INTO AlumniWorkHistory (SSN, CompanyName, StartDate, JobTitle) VALUES
('123-45-6789', 'TechTrendz', '2021-01-15', 'Software Engineer'),
('987-65-4321', 'Nordic Press', '2019-03-01', 'Editor'),
('456-78-9012', 'Green Planet', '2022-06-10', 'Biologist'),
('321-54-9876', 'Historia Inc.', '2020-09-01', 'Historian'),
('789-12-3456', 'Quantum Labs', '2018-11-20', 'Researcher');

/* 13. MemberGroupMembership */
INSERT INTO MemberGroupMembership (SSN, ClubID, GroupID, MembershipStart, MembershipEnd) VALUES
('123-45-6789', 3, 3, '2024-01-01', NULL), -- Aarav in Tech Titans
('987-65-4321', 4, 4, '2023-05-15', NULL), -- Bjorn in Story Weavers
('456-78-9012', 2, 2, '2023-09-01', '2024-12-31'), -- Zuri in Eco Guardians
('321-54-9876', 5, 5, '2024-02-10', NULL), -- Xochitl in Rhythm Keepers
('789-12-3456', 1, 1, '2023-11-01', NULL); -- Ksenia in Stargazers

/* 14. MemberProjectPayments */
INSERT INTO MemberProjectPayments (SSN, ClubID, GroupID, ProjectID, PaymentAmount) VALUES
('123-45-6789', 3, 3, 3, 500.00), -- Aarav pays for AI Research Lab
('987-65-4321', 4, 4, 4, 100.00), -- Bjorn pays for Oral History Archive
('456-78-9012', 2, 2, 2, 200.00), -- Zuri pays for Wildlife Rescue
('321-54-9876', 5, 5, 5, 300.00), -- Xochitl pays for Dance Costume Fund
('789-12-3456', 1, 1, 1, 400.00); -- Ksenia pays for Telescope Upgrade

/* 15. MemberGroupLeaders */
INSERT INTO MemberGroupLeaders (SSN, ClubID, GroupID) VALUES
('789-12-3456', 1, 1), -- Ksenia leads Stargazers
('456-78-9012', 2, 2), -- Zuri leads Eco Guardians
('123-45-6789', 3, 3), -- Aarav leads Tech Titans
('987-65-4321', 4, 4), -- Bjorn leads Story Weavers
('321-54-9876', 5, 5); -- Xochitl leads Rhythm Keepers