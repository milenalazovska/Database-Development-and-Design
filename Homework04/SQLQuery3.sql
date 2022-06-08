--Declare scalar variable for storing FirstName values
DECLARE @FirstName nvarchar(100)

--Assign value ‘Antonio’ to the FirstName variable
SET @FirstName = 'Antonio'
SELECT @FirstName

--Find all Students having FirstName same as the variable
SELECT * FROM Student
WHERE Student.FirstName = @FirstName

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
DECLARE @StudentTable TABLE
(StudentId int, StudentName nvarchar(100), DateOfBirth date)

--Fill the table variable with all Female students
INSERT INTO @StudentTable
SELECT Id, FirstName, DateOfBirth FROM Student
WHERE Gender = 'f'

SELECT * FROM @StudentTable

--Declare temp table that will contain LastName and EnrolledDate columns
CREATE TABLE #NewTempTable
(LastName nvarchar(100), EnrolledDate date)

--Fill the temp table with all Male students having First Name starting with ‘A’
INSERT INTO #NewTempTable
SELECT LastName, EnrolledDate FROM Student
WHERE Gender = 'M' AND FirstName LIKE 'A%'

--Retrieve the students from the table which last name is with 7 characters
SELECT * FROM Student
WHERE LEN(LastName) = 7

--Find all teachers whose FirstName length is less than 5 and the first 3 characters of their FirstName and LastName are the same
SELECT * FROM Teacher
WHERE LEN(FirstName) < 5 and LEFT(FirstName, 3) = LEFT(LastName, 3)