--Calculate the count of all grades per Teacher in the system
SELECT COUNT(Grade) AS Grade FROM Grade
GROUP BY TeacherID

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT COUNT(Grade) AS Grade FROM Grade
WHERE StudentID < 100
GROUP BY TeacherID

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT MAX(Grade) AS MaximalGrade, AVG(Grade) AS AverageGrade FROM [Grade]
GROUP BY StudentID 

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT COUNT(Grade) AS Grade FROM Grade
GROUP BY TeacherID
HAVING COUNT(Grade) > 200

--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
SELECT COUNT(Grade) AS GradeCount, MAX(Grade) AS MaximalGrade, AVG(Grade) AS AverageGrade FROM [Grade]
GROUP BY StudentID
HAVING MAX(Grade) = AVG(Grade)

--List Student First Name and Last Name next to the other details from previous query
SELECT Student.FirstName, Student.LastName,(Grade) AS GradeCount, MAX(Grade) AS MaximalGrade, AVG(Grade) AS AverageGrade FROM [Grade]
JOIN Student ON StudentID = Student.Id
GROUP BY Student.FirstName, Student.LastName
HAVING MAX(Grade) = AVG(Grade)

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
GO;
CREATE VIEW vw_StudentGrades AS
(
SELECT StudentID, COUNT(Grade) AS Grade FROM [Grade]
INNER JOIN Student ON Student.Id = StudentID
GROUP BY StudentID
)
GO;
SELECT * FROM vw_StudentGrades

--Change the view to show Student First and Last Names instead of StudentID
GO;
ALTER VIEW vw_StudentGrades AS
(
SELECT Student.FirstName, Student.LastName, COUNT(Grade) AS Grade FROM [Grade] 
INNER JOIN Student ON Student.Id = StudentID
GROUP BY Student.FirstName, Student.LastName
)
GO;
SELECT * FROM vw_StudentGrades

--List all rows from view ordered by biggest Grade Count
GO;
ALTER VIEW vw_StudentGrades AS
(
SELECT TOP 1000 Student.FirstName, Student.LastName, COUNT(Grade) AS Grade FROM [Grade] 
INNER JOIN Student ON Student.Id = StudentID
GROUP BY Student.FirstName, Student.LastName
ORDER BY COUNT(Grade)DESC
)
GO;
SELECT * FROM vw_StudentGrades