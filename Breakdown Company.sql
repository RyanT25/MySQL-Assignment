-- Assignment: Breakdown Company --
CREATE DATABASE Assignment;
USE Assignment;

-- ---------------------------------------------------

-- TASK 1 --
-- Create Tables & Primary Keys
CREATE TABLE Members
	(
		Member_ID INT PRIMARY KEY,
        First_Name VARCHAR(20),
        Last_Name VARCHAR(20),
        Member_Location VARCHAR(20),
        Member_Age INT
    );

CREATE TABLE Vehicles
	(
		Vehicle_Registration VARCHAR(10) PRIMARY KEY,
        Vehicle_Make VARCHAR(10),
        Vehicle_Model VARCHAR(10),
        Member_ID INT -- Foreign Key
    );

CREATE TABLE Engineers
	(
		Engineer_ID INT PRIMARY KEY,
        First_Name VARCHAR(20),
        Last_Name VARCHAR(20)
    );

CREATE TABLE Breakdowns
	(
		Breakdown_ID INT PRIMARY KEY,
        Vehicle_Registration VARCHAR(10), -- Foreign Key
        Engineer_ID INT, -- Foreign Key
        Breakdown_Date DATE,
        Breakdown_Time TIME,
        Breakdown_Location VARCHAR(20)
    );

-- Add Foreign Keys
ALTER TABLE Vehicles ADD FOREIGN KEY(Member_ID) REFERENCES Members(Member_ID);
ALTER TABLE Breakdowns ADD FOREIGN KEY(Vehicle_Registration) REFERENCES Vehicles(Vehicle_Registration);
ALTER TABLE Breakdowns ADD FOREIGN KEY(Engineer_ID) REFERENCES Engineers(Engineer_ID);

-- ---------------------------------------------------

-- TASK 2 --
-- Insert Table Data

-- Members Data
INSERT INTO Members (Member_ID, First_Name, Last_Name, Member_Location, Member_Age)
VALUES
	(1, 'John', 'Doe', 'New York', 32),
	(2, 'Jane', 'Smith', 'Los Angeles', 27),
	(3, 'Mark', 'Jones', 'Chicago', 45),
	(4, 'Emily', 'Davis', 'Houston', 30),
	(5, 'Luke', 'Brown', 'Phoenix', 38),
	(6, 'Sophia', 'White', 'Dallas', 29),
	(7, 'Liam', 'Taylor', 'Miami', 41),
	(8, 'Olivia', 'Green', 'San Diego', 36),
	(9, 'James', 'Harris', 'Denver', 33),
	(10, 'Mia', 'Robinson', 'Atlanta', 25);

-- Vehicles Data
INSERT INTO Vehicles (Vehicle_Registration, Vehicle_Make, Vehicle_Model, Member_ID)
VALUES
	('ABC1234', 'Toyota', 'Corolla', 1),
	('XYZ5678', 'Ford', 'Mustang', 2),
	('DEF1111', 'Honda', 'Civic', 3),
	('GHI2222', 'Chevy', 'Cruze', 4),
	('JKL3333', 'BMW', 'X5', 5),
	('MNO4444', 'Audi', 'A4', 1),
	('PQR5555', 'Mercedes', 'C300', 2),
	('STU6666', 'Nissan', 'Altima', 3),
	('VWX7777', 'Hyundai', 'Elantra', 6),
	('YZA8888', 'Tesla', 'Model S', 7),
	('BCD9999', 'Kia', 'Sportage', 8),
	('EFG1112', 'Subaru', 'Forester', 9),
	('HIJ1212', 'Jeep', 'Wrangler', 10),
	('KLM1414', 'Mazda', 'CX-5', 4),
	('NOP1515', 'Honda', 'Accord', 5),
	('QRS1616', 'Chevy', 'Malibu', 6),
	('TUV1717', 'Nissan', 'Sentra', 7),
	('WXY1818', 'Ford', 'Explorer', 8),
	('ZAB1919', 'Volvo', 'XC90', 9),
	('CDE2020', 'Lexus', 'RX350', 10);

-- Engineers Data
INSERT INTO Engineers (Engineer_ID, First_Name, Last_Name)
VALUES
	(1, 'Ethan', 'Williams'),
	(2, 'Olivia', 'Miller'),
	(3, 'Sophia', 'Clark'),
	(4, 'Noah', 'Walker');

-- Breakdowns Data
INSERT INTO Breakdowns (Breakdown_ID, Vehicle_Registration, Engineer_ID, Breakdown_Date, Breakdown_Time, Breakdown_Location)
VALUES
	(1, 'ABC1234', 1, '2024-09-10', '10:30:00', 'New York'),
	(2, 'XYZ5678', 2, '2024-09-10', '11:00:00', 'Los Angeles'),
	(3, 'DEF1111', 3, '2024-09-10', '12:30:00', 'Chicago'),
	(4, 'GHI2222', 4, '2024-09-15', '14:00:00', 'Houston'),
	(5, 'JKL3333', 1, '2024-09-18', '09:45:00', 'Phoenix'),
	(6, 'MNO4444', 2, '2024-09-25', '08:20:00', 'New York'),
	(7, 'PQR5555', 3, '2024-09-28', '11:15:00', 'Los Angeles'),
	(8, 'STU6666', 4, '2024-09-30', '15:30:00', 'Chicago'),
	(9, 'ABC1234', 2, '2024-10-10', '09:30:00', 'New York'),
	(10, 'XYZ5678', 3, '2024-10-15', '13:30:00', 'Los Angeles'),
	(11, 'DEF1111', 4, '2024-10-20', '14:45:00', 'Chicago'),
	(12, 'MNO4444', 1, '2024-10-22', '16:20:00', 'New York'),
	(13, 'JKL3333', 2, '2024-10-25', '17:00:00', 'Phoenix'),
	(14, 'VWX7777', 3, '2024-11-01', '08:00:00', 'Dallas'),
	(15, 'YZA8888', 4, '2024-11-05', '09:00:00', 'Miami'),
	(16, 'BCD9999', 1, '2024-11-10', '10:30:00', 'San Diego'),
	(17, 'EFG1112', 2, '2024-11-15', '14:00:00', 'Denver'),
	(18, 'HIJ1212', 3, '2024-11-18', '11:00:00', 'Atlanta'),
	(19, 'KLM1414', 4, '2024-11-20', '15:45:00', 'Houston'),
	(20, 'NOP1515', 1, '2024-11-25', '16:30:00', 'Phoenix');

-- ---------------------------------------------------

-- TASK 3 --
-- Perform Queries

-- 1. Retrieve the first 5 members from the Member table.
SELECT * FROM Members LIMIT 5;
-- 2. Retrieve 5 members starting from the 6th row.
SELECT * FROM Members LIMIT 5 OFFSET 5;
-- 3. List members who are older than 30 years.
SELECT * FROM Members WHERE Member_Age>30;
-- 4. Find members who live in either New York or Los Angeles.
SELECT * FROM Members WHERE Member_Location IN('New York','Los Angeles');
-- 5. Retrieve all vehicles where the make is either 'Toyota' or 'Honda'.
SELECT * FROM Vehicles WHERE Vehicle_Make='Toyota' OR Vehicle_Make='Honda';
-- 6. Find members whose age is between 25 and 40 years.
SELECT * FROM Members WHERE Member_Age>25 AND Member_Age<40;
-- 7. List vehicles whose registration number starts with the letter 'A'.
SELECT * FROM Vehicles WHERE Vehicle_Registration LIKE 'A%';
-- 8. Find vehicles where the model ends with the number '5'.
SELECT * FROM Vehicles WHERE Vehicle_Model LIKE '%5';
-- 9. List all engineers and order them alphabetically by their last name.
SELECT * FROM Engineers ORDER BY Last_Name ASC;
-- 10. Retrieve all members and order them by age in descending order.
SELECT * FROM Members ORDER BY Member_Age DESC;
-- 11. Count the total number of members in the Member table.
SELECT COUNT(*) AS 'Total number of members' FROM Members;
-- 12. Retrieve all breakdowns that occurred in the year 2024.
SELECT * FROM Breakdowns WHERE Breakdown_Date LIKE '%2024%';
-- 13. Find breakdowns for vehicles with the registration 'ABC1234' or 'XYZ5678'.
SELECT * FROM Breakdowns WHERE Vehicle_Registration IN('ABC1234', 'XYZ5678');
-- 14. List all vehicles with the make 'Ford'.
SELECT * FROM Vehicles WHERE Vehicle_Make='Ford';
-- 15. Find members whose first name starts with the letter 'J'.
SELECT * FROM Members WHERE First_Name LIKE 'J%';
-- 16. Retrieve breakdowns that occurred before October 1, 2024.
SELECT * FROM Breakdowns WHERE Breakdown_Date<'2024-10-01';
-- 17. List members whose last name contains 'son'.
SELECT * FROM Members WHERE Last_Name LIKE '%son%';
-- 18. Find breakdowns that occurred in locations containing 'New'.
SELECT * FROM Breakdowns WHERE Breakdown_Location LIKE '%New%';
-- 19. Retrieve the youngest member in the Member table.
SELECT * FROM Members ORDER BY Member_Age ASC LIMIT 1;
-- 20. Retrieve the oldest member in the Member table.
SELECT * FROM Members ORDER BY Member_Age DESC LIMIT 1;
-- 21. Find vehicles owned by members who live in Los Angeles.
SELECT * FROM Vehicles INNER JOIN Members ON Vehicles.Member_ID=Members.Member_ID WHERE Member_Location='Los Angeles';
-- 22. Retrieve all breakdowns handled by the engineer with ID 1.
SELECT * FROM Breakdowns WHERE Engineer_ID=1;
-- 23. List all members who are younger than 35 years.
SELECT * FROM Members WHERE Member_Age<35;
-- 24. Find members who live in either Phoenix or Houston.
SELECT * FROM Members WHERE Member_Location IN('Phoenix','Houston');
-- 25. Retrieve vehicles where the model is either 'Civic' or 'Mustang'.
SELECT * FROM Vehicles WHERE Vehicle_Model='Civic' OR Vehicle_Model='Mustang';
-- 26. List members whose first name contains the letter 'a'.
SELECT * FROM Members WHERE First_Name LIKE '%a%';
-- 27. Retrieve breakdowns that occurred between September 1, 2024, and September 30, 2024.
SELECT * FROM Breakdowns WHERE Breakdown_Date>='2024-09-01' AND Breakdown_Date<='2024-09-30';
-- 28. Find members whose age is not between 20 and 40 years.
SELECT * FROM Members WHERE NOT Member_Age<20 AND Member_Age>40;
-- 29. List breakdowns that occurred after October 1, 2024.
SELECT * FROM Breakdowns WHERE Breakdown_Date>'2024-10-01';
-- 30. Retrieve the top 3 oldest members from the Member table.
SELECT * FROM Members ORDER BY Member_Age DESC LIMIT 3;

-- Medium Tasks 

-- 1. Count the number of breakdowns for each vehicle.
SELECT CONCAT(Vehicle_Make,' ', Vehicle_Model) AS 'Car Make/Model', COUNT(Breakdowns.Vehicle_Registration) AS 'No of Breakdowns' FROM Breakdowns INNER JOIN Vehicles ON Breakdowns.Vehicle_Registration=Vehicles.Vehicle_Registration GROUP BY Breakdowns.Vehicle_Registration;
-- 2. Find members who own more than one vehicle.
SELECT CONCAT(First_Name,' ', Last_Name) AS 'Members Name', COUNT(Vehicles.Member_ID) AS 'Cars Owned' FROM Members INNER JOIN Vehicles ON Members.Member_ID=Vehicles.Member_ID GROUP BY Vehicles.Member_ID;
-- 3. Retrieve the total number of breakdowns handled by each engineer.
SELECT CONCAT(First_Name,' ', Last_Name) AS 'Engineer', COUNT(Breakdowns.Engineer_ID) AS 'No of Breakdowns' FROM Engineers INNER JOIN Breakdowns ON Engineers.Engineer_ID=Breakdowns.Engineer_ID GROUP BY Breakdowns.Engineer_ID;
-- 4. Group breakdowns by location and sort them by the total number of breakdowns in each location.
SELECT Breakdown_Location, COUNT(Vehicle_Registration) AS 'No of Breakdowns' FROM Breakdowns GROUP BY Breakdown_Location;
-- 5. List vehicles owned by members who are younger than 30 years.
SELECT CONCAT(Vehicle_Make,' ', Vehicle_Model) AS 'Vehicles Owned by Under 30s' FROM Vehicles LEFT JOIN Members ON Vehicles.Member_ID=Members.Member_ID WHERE Member_Age<30;
-- 6. Retrieve all breakdowns and sort them by time in descending order.
SELECT * FROM Breakdowns ORDER BY Breakdown_Time DESC;
-- 7. Find all breakdowns for vehicles owned by members who live in New York.
SELECT Breakdowns.*, Member_Location FROM Breakdowns INNER JOIN Members INNER JOIN Vehicles ON Breakdowns.Vehicle_Registration=Vehicles.Vehicle_Registration AND Vehicles.Member_ID=Members.Member_ID WHERE Member_Location='New York';
-- 8. Retrieve members who do not own any vehicles.
SELECT * FROM Members INNER JOIN Vehicles ON Members.Member_ID=Vehicles.Member_ID WHERE Vehicle_Registration IS NULL;
-- 9. Find breakdowns that occurred in the same city where the vehicle owner resides.
SELECT Breakdowns.*, Member_Location FROM Breakdowns INNER JOIN Members INNER JOIN Vehicles ON Breakdowns.Vehicle_Registration=Vehicles.Vehicle_Registration AND Vehicles.Member_ID=Members.Member_ID WHERE Member_Location=Breakdown_Location;
-- 10. Retrieve the total number of breakdowns handled by each engineer during 2024.
SELECT CONCAT(First_Name,' ', Last_Name) AS 'Engineer', COUNT(Engineers.Engineer_ID) AS 'Handled Breakdowns in 2024' FROM  Engineers LEFT JOIN Breakdowns ON Engineers.Engineer_ID=Breakdowns.Engineer_ID WHERE YEAR(Breakdown_Date)='2024' GROUP BY Engineers.Engineer_ID;

