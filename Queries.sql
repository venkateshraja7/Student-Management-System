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