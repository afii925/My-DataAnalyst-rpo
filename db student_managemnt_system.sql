-- Create database (optional)
CREATE DATABASE IF NOT EXISTS StudentManagement;
USE StudentManagement;

-- Create Students Table
CREATE TABLE IF NOT EXISTS Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

-- Create Marks Table
CREATE TABLE IF NOT EXISTS Marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    subject VARCHAR(50),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Insert Sample Data
INSERT INTO Students (student_id, name, department) VALUES
(1, 'Ali', 'CS'),
(2, 'Ayesha', 'IT'),
(3, 'Ahmed', 'SE'),
(4, 'Sana', 'CS');

INSERT INTO Marks (student_id, subject, marks) VALUES
(1, 'DBMS', 80),
(2, 'DBMS', 75),
(1, 'OOP', 70),
(3, 'DBMS', 85);

-- ========== Stored Procedures ==========

-- 1. GetAllStudents
DELIMITER //

CREATE PROCEDURE GetAllStudents()
BEGIN
    SELECT * FROM Students;
END //

DELIMITER ;

-- 2. GetMarksByStudent
DELIMITER //

CREATE PROCEDURE GetMarksByStudent(IN input_student_id INT)
BEGIN
    SELECT subject, marks 
    FROM Marks
    WHERE student_id = input_student_id;
END //

DELIMITER ;

-- 3. InsertMark
DELIMITER //

CREATE PROCEDURE InsertMark(
    IN input_student_id INT,
    IN input_subject VARCHAR(50),
    IN input_marks INT
)
BEGIN
    INSERT INTO Marks (student_id, subject, marks)
    VALUES (input_student_id, input_subject, input_marks);
END //

DELIMITER ;

-- 4. CheckPassStatus
DELIMITER //

CREATE PROCEDURE CheckPassStatus(IN input_marks INT)
BEGIN
    IF input_marks >= 50 THEN
        SELECT 'Pass' AS status;
    ELSE
        SELECT 'Fail' AS status;
    END IF;
END //

DELIMITER ;

-- 5. ShowAllStudentMarks (Cursor Example)
DELIMITER //

CREATE PROCEDURE ShowAllStudentMarks()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE s_id INT;
    DECLARE s_name VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT student_id, name FROM Students;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO s_id, s_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT CONCAT('Student: ', s_name, ', ID: ', s_id) AS StudentInfo;
        SELECT subject, marks FROM Marks WHERE student_id = s_id;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;


-- Get all students
CALL GetAllStudents();

-- Manually select a student ID to see marks
SET @student_id = 4;
CALL GetMarksByStudent(@student_id);

-- Manually insert a mark
SET @insert_student_id = 4;
SET @insert_subject = 'OOP';
SET @insert_marks = 95;
CALL InsertMark(@insert_student_id, @insert_subject, @insert_marks);

-- Manually check pass/fail status
SET @marks_to_check = 40;
CALL CheckPassStatus(@marks_to_check);

-- Show all student names and their marks
CALL ShowAllStudentMarks();