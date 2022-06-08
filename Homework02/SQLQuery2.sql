USE [sedcdb2]

--Find all Students  with FirstName = Antonio
SELECT * FROM Student
WHERE FirstName = 'Antonio'

--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT * FROM Student
WHERE DateOfBirth > '01.01.1999'

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT * FROM Student
WHERE LastName = 'J%' and EnrolledDate between '1998-01-01' and '1998-01-02'

--List all Students ordered  by FirstName
SELECT * FROM Student
ORDER BY FirstName

--List all Teacher  Last Names and Student Last Names in single result set. Remove  duplicates
SELECT [LastName]
FROM Teacher
UNION 
SELECT [LastName]
FROM Student

--Create Foreign key constraints from diagram or with script
ALTER TABLE GRADE
ADD CONSTRAINT FK_GRADE_TeacherID
FOREIGN KEY (TeacherID)
REFERENCES Teacher (ID)

--List all possible combinations  of Courses  names and AchievementType names that can be passed by student
SELECT c.Name, a.Name from Course as c
CROSS JOIN AchievementType as a

--List all Teachers  without exam Grade
SELECT * FROM Teacher AS t
LEFT JOIN [Grade] AS g
ON t.Id = g.TeacherID
WHERE Grade IS NULL