-- creating the database
CREATE DATABASE SISDB;

-- using the sisdb
USE SISDB;

-- 2.1  Define Tables SCHEMA
-- Students table
CREATE TABLE Students(
	student_id INT PRIMARY KEY,
	first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15)
);

-- Course Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

--Enrollments table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Teacher table
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- 3.a Insert 10 records in the tables
-- students table
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
	(1, 'Amit', 'Kumar', '1995-03-15', 'amit.kumar@example.com', '9876543210'),
    (2, 'Priya', 'Sharma', '1996-05-20', 'priya.sharma@example.com', '8765432109'),
    (3, 'Rahul', 'Singh', '1994-08-12', 'rahul.singh@example.com', '7654321098'),
    (4, 'Anjali', 'Verma', '1997-02-28', 'anjali.verma@example.com', '6543210987'),
    (5, 'Raj', 'Patel', '1993-11-10', 'raj.patel@example.com', '5432109876'),
    (6, 'Neha', 'Gupta', '1998-09-03', 'neha.gupta@example.com', '4321098765'),
    (7, 'Sandeep', 'Yadav', '1992-06-25', 'sandeep.yadav@example.com', '3210987654'),
    (8, 'Kavita', 'Choudhary', '1999-12-07', 'kavita.choudhary@example.com', '2109876543'),
    (9, 'Harish', 'Rathore', '1991-04-18', 'harish.rathore@example.com', '1098765432'),
    (10, 'Pooja', 'Malik', '1996-01-30', 'pooja.malik@example.com', '9876543210');

-- Cousre table
INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
    (1, 'Mathematics', 3, 4),
    (2, 'Computer Science', 4, 2),
    (3, 'Physics', 3, 3),
    (4, 'History', 3, 1),
    (5, 'English Literature', 3, 1),
    (6, 'Chemistry', 4, 4),
    (7, 'Economics', 3, 2),
    (8, 'Biology', 4, 4),
    (9, 'Political Science', 3, 3),
    (10, 'Psychology', 3, 2);

-- Enrollment table
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
    (1, 1, 1, '2023-01-15'),
    (2, 2, 2, '2023-01-16'),
    (3, 3, 3, '2023-01-17'),
    (4, 4, 4, '2023-01-18'),
    (5, 5, 5, '2023-01-19'),
    (6, 6, 6, '2023-01-20'),
    (7, 7, 7, '2023-01-21'),
    (8, 8, 8, '2023-01-22'),
    (9, 9, 9, '2023-01-23'),
    (10, 10, 10, '2023-01-24');

-- Teachers table
INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
    (1, 'Rajesh', 'Kumar', 'rajesh.kumar@example.com'),
    (2, 'Priya', 'Sharma', 'priya.sharma@example.com'),
    (3, 'Ankit', 'Patel', 'ankit.patel@example.com'),
    (4, 'Sneha', 'Singh', 'sneha.singh@example.com');

-- Payments table
INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
    (1, 1, 500.00, '2023-02-01'),
    (2, 2, 700.50, '2023-02-02'),
    (3, 3, 600.25, '2023-02-03'),
    (4, 4, 800.75, '2023-02-04'),
    (5, 5, 550.90, '2023-02-05'),
    (6, 6, 900.00, '2023-02-06'),
    (7, 7, 750.30, '2023-02-07'),
    (8, 8, 620.40, '2023-02-08'),
    (9, 9, 1000.50, '2023-02-09'),
    (10, 10, 450.75, '2023-02-10');

-- 3.b.1 Insert a new student data in students table as mentioned
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES 
	(11, 'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

-- 3.b.2 Query to enroll a student in a course. choose existing student and course insert in enrollments table

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (11, 11, 5, '2023-11-28');

DECLARE @StudentID INT;
DECLARE @CourseID INT;
DECLARE @EnrollmentDate DATE;
SET @StudentID = 3;
SET @CourseID = 7;
SET @EnrollmentDate = '2023-5-3';
INSERT INTO Enrollments (enrollment_id,student_id,course_id,enrollment_date)
VALUES (12,@StudentID,@CourseID,@EnrollmentDate);
SELECT * FROM Enrollments

-- 3.b.3 update the email adress of any teacher from teacher table
UPDATE Teacher SET email = 'kumar.rajesh@example.com' WHERE teacher_id = 1;


-- 3.b.4 delete an enrollment record ferom enrollment table 
DELETE FROM Enrollments
WHERE student_id = 3 AND course_id = 7;

-- 3.b.5 Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.
UPDATE Courses SET teacher_id = 2 WHERE course_id = 1;

-- 3.b.6 delete a specific student from student table its associated enrollment records
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)VALUES (11, 11, 105, '2023-11-28');

DELETE FROM Enrollments WHERE student_id = 11;
    
DELETE FROM Students WHERE student_id = 11;
-- 3.b.7 update the payment amount in payment table
UPDATE Payments
SET amount = 321
WHERE payment_id = 1;
SELECT * FROM Payments

-- JOINS QUESTION
-- 4.1 Query to calculate total payment made by a specific student, need to join students and payments table using stdent id
SELECT Students.student_id,Students.first_name,Students.last_name,
SUM(Payments.amount) AS total_payments
FROM Students
JOIN Payments ON Students.student_id = Payments.student_id
WHERE Students.student_id = 1
GROUP BY Students.student_id,Students.first_name,Students.last_name;

-- 4.2 Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. 
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS enrolled_students FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- 4.3 Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.
SELECT Students.student_id,Students.first_name,Students.last_name
FROM Students
LEFT JOIN Enrollments ON Students.student_id = Enrollments.student_id
WHERE Enrollments.enrollment_id IS NULL;

-- 4.4 Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.
SELECT Students.first_name,Students.last_name,Courses.course_name
FROM Students
JOIN Enrollments ON Students.student_id = Enrollments.student_id
JOIN Courses ON Enrollments.course_id = Courses.course_id;

-- 4.5 Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.
SELECT Teacher.first_name,Teacher.last_name,Courses.course_name
FROM Teacher
JOIN Courses ON Teacher.teacher_id = Courses.teacher_id;

-- 4.6 Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables.
SELECT Students.first_name,Students.last_name,Enrollments.enrollment_date
FROM Students
Join Enrollments ON Students.student_id = Enrollments.student_id
JOIN Courses ON Enrollments.course_id = Courses.course_id
WHERE Courses.course_name = 'Mathematics'; 

-- 4.7 Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.
SELECT Students.first_name,Students.last_name
FROM Students
LEFT JOIN Payments ON Students.student_id = Payments.student_id
WHERE Payments.payment_id IS NULL;

-- 4.8 Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records.
SELECT Courses.course_id,Courses.course_name
FROM Courses 
LEFT JOIN Enrollments ON Courses.course_id = Enrollments.course_id
WHERE Enrollments.enrollment_id IS NULL;

-- 4.9 Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records.
SELECT e1.student_id,s.first_name,s.last_name
FROM Enrollments e1
JOIN Enrollments e2 ON e1.student_id = e2.student_id AND e1.enrollment_id <> e2.enrollment_id
JOIN Students s ON e1.student_id = s.student_id
GROUP BY e1.student_id, s.first_name, s.last_name
HAVING COUNT(DISTINCT e1.course_id) < 1;

-- 4.10 Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments
SELECT Teacher.teacher_id,Teacher.first_name,Teacher.last_name
FROM Teacher
LEFT JOIN Courses ON Teacher.teacher_id = Courses.teacher_id
WHERE Courses.course_id IS NULL;


--aggregate functions
-- 5.1 Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this
SELECT AVG(EnrollmentCount) AS average_students_per_course
FROM (
    SELECT
        Courses.course_id,
        COUNT(Enrollments.student_id) AS EnrollmentCount
    FROM
        Courses 
    LEFT JOIN
        Enrollments ON Courses.course_id = Enrollments.course_id
    GROUP BY
        Courses.course_id
) AS CourseEnrollments;

-- 5.2 Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount.
SELECT Students.student_id,Students.first_name,Students.last_name,
    Payments.amount AS highest_payment
FROM Students 
JOIN Payments ON Students.student_id = Payments.student_id
WHERE Payments.amount = (SELECT MAX(amount) FROM Payments);


-- 5.3 Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count
SELECT Courses.course_id,Courses.course_name,
    EnrollmentsCount AS enrollment_count
FROM Courses
JOIN (
    SELECT
        course_id,
        COUNT(student_id) AS EnrollmentsCount
    FROM
        Enrollments
    GROUP BY
        course_id
) AS EnrollmentCounts ON Courses.course_id = EnrollmentCounts.course_id
WHERE
    EnrollmentsCount = (SELECT MAX(EnrollmentsCount) FROM (
        SELECT
            COUNT(student_id) AS EnrollmentsCount
        FROM
            Enrollments
        GROUP BY
            course_id
    ) AS MaxEnrollments);



-- 5.4 Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses.
SELECT
    Teacher.teacher_id,
    Teacher.first_name,
    Teacher.last_name,
    SUM(Payments.amount) AS total_payments_for_courses
FROM
    Teacher 
JOIN
    Courses ON Teacher.teacher_id = Courses.teacher_id
LEFT JOIN
    Enrollments ON Courses.course_id = Enrollments.course_id
LEFT JOIN
    Payments ON Enrollments.student_id = Payments.student_id
GROUP BY
    Teacher.teacher_id, Teacher.first_name, Teacher.last_name;



-- 5.5 Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses.

SELECT
    Students.student_id,
    Students.first_name,
    Students.last_name
FROM
    Students
WHERE
    NOT EXISTS (
        SELECT Courses.course_id
        FROM Courses 
        WHERE NOT EXISTS (
            SELECT Enrollments.course_id
            FROM Enrollments 
            WHERE Enrollments.student_id = Students.student_id AND Enrollments.course_id = Courses.course_id
        )
    );



-- 5.6 Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.
SELECT
    Teacher.teacher_id,
    Teacher.first_name,
    Teacher.last_name
FROM
    Teacher
WHERE
    NOT EXISTS (
        SELECT 1
        FROM Courses 
        WHERE Courses.teacher_id = Teacher.teacher_id
    );


-- 5.7 Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth.
SELECT
    AVG(StudentAge) AS average_student_age
FROM (
    SELECT
        DATEDIFF(YEAR, date_of_birth, GETDATE()) AS StudentAge
    FROM
        Students
) AS StudentAges;



-- 5.8 Identify courses with no enrollments. Use subqueries to find courses without enrollment records.
SELECT
    course_id,
    course_name
FROM
    Courses
WHERE
    NOT EXISTS (
        SELECT 1
        FROM Enrollments
        WHERE Enrollments.course_id = Courses.course_id
    );


--5.9 Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments.
SELECT Students.student_id,Students.first_name,Students.last_name,Courses.course_id,Courses.course_name,
COALESCE(SUM(Payments.amount), 0) AS total_payments
FROM Students
CROSS JOIN Courses
LEFT JOIN Payments ON Students.student_id = Payments.student_id 
GROUP BY STUDENTS.student_id,Students.first_name,Students.last_name,Courses.course_id,Courses.course_name;


-- 5.10 Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one.
SELECT
    s.student_id,
    s.first_name,
    s.last_name
FROM
    Students s
JOIN
    Payments p ON s.student_id = p.student_id
GROUP BY
    s.student_id, s.first_name, s.last_name
HAVING
    COUNT(p.payment_id) > 1;


-- 5.11 . Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    SUM(p.amount) AS total_payments
FROM
    Students s
JOIN
    Payments p ON s.student_id = p.student_id
GROUP BY
    s.student_id, s.first_name, s.last_name;



-- 5.12 . Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments
SELECT
    c.course_id,
    c.course_name,
    COUNT(e.student_id) AS student_count
FROM
    Courses c
LEFT JOIN
    Enrollments e ON c.course_id = e.course_id
GROUP BY
    c.course_id, c.course_name;

-- 5.13 Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average.
SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    AVG(p.amount) AS average_payment_amount
FROM
    Students s
JOIN
    Payments p ON s.student_id = p.student_id
GROUP BY
    s.student_id, s.first_name, s.last_name;


