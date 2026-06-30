CREATE DATABASE StudentManagementSystem;
USE StudentManagementSystem;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    duration_months INT
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students VALUES
(101,'Vignesh',22,'Male','Chennai'),
(102,'Priya',21,'Female','Madurai'),
(103,'Arun',23,'Male','Coimbatore'),
(104,'Divya',22,'Female','Trichy'),
(105,'Kumar',24,'Male','Salem');

INSERT INTO Courses VALUES
(1,'Java',6),
(2,'Python',4),
(3,'SQL',3),
(4,'Testing',2);

INSERT INTO Enrollments VALUES
(1,101,1),
(2,101,3),
(3,102,2),
(4,103,1),
(5,104,4),
(6,105,3);

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;


SELECT * FROM Students
WHERE city = 'Chennai';

SELECT * FROM Students
WHERE age > 22;

SELECT * FROM Students
ORDER BY student_name;

SELECT s.student_id, s.student_name,
       c.course_name,s.age,s.gender,s.city,c.course_name,c.duration_months
FROM Students s
JOIN Enrollments e
ON s.student_id = e.student_id
JOIN Courses c
ON e.course_id = c.course_id;

SELECT COUNT(*) AS Total_Students
FROM Students;

SELECT AVG(age) AS Average_Age
FROM Students;


UPDATE Students
SET student_name = 'Venkatesh',
    age = 22,
    city='Dharmapuri'
WHERE student_id = 101;

UPDATE courses
SET course_name = 'Software Testing'
WHERE course_id = 1;

DELETE FROM Students
WHERE student_id = 105;

CREATE VIEW StudentCourseView AS
SELECT s.student_name,
       c.course_name
FROM Students s
JOIN Enrollments e
ON s.student_id = e.student_id
JOIN Courses c
ON e.course_id = c.course_id;

SELECT * FROM StudentCourseView;