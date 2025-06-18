-- Part 1: DDL Commands
-- Task 1: Database and Table Creation

CREATE  DATABASE SchoolDB;
USE SchoolDB;

CREATE TABLE Students (
    Student_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Email VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE Courses (
	Course_ID INT AUTO_INCREMENT PRIMARY KEY,
    Course_Name VARCHAR(100),
    Instructor VARCHAR(50)
);

-- Task 2: Modifying Table Structure

ALTER TABLE Students ADD PhoneNumber VARCHAR(15);
ALTER TABLE Students MODIFY PhoneNumber VARCHAR(20);
ALTER TABLE Students CHANGE PhoneNumber Contact VARCHAR(20);

-- Task 3: Deleting Table Data

TRUNCATE TABLE Courses; 
DROP TABLE Courses; 

-- Task 4: Checking Table Structure

DESC Students;

-- Part 2: DML Commands

-- Task 5: Inserting Data
INSERT INTO Students (Name, Age, Email, Address, Contact)
VALUES
    ('Alice', 20, 'alice@example.com', '123 Main St, NY', '123-456-7890'),
    ('Bob', 22, 'bob@example.com', '456 Oak St, CA', '987-654-3210'),
    ('Charlie', 24, 'charlie@example.com', '789 Pine St, TX', '555-555-5555'),
    ('David', 26, 'david@example.com', '321 Elm St, NY', '444-444-4444'),
    ('Eve', 23, 'eve@example.com', '654 Maple St, FL', '333-333-3333');

-- Task 6: Updating Data
UPDATE Students SET Age = 23 WHERE Name = 'Bob';
UPDATE Students SET Age = Age + 1;

-- Task 7: Deleting Data
DELETE FROM Students WHERE Name = 'Charlie';
DELETE FROM Students WHERE Age > 25;

-- Task 8: Retrieving Data (SELECT Queries)
SELECT * FROM Students;
SELECT Name, Email FROM Students;
SELECT * FROM Students WHERE Address LIKE '%NY%';
SELECT * FROM Students ORDER BY Age DESC;
SELECT COUNT(*) AS Total_Students FROM Students;
















