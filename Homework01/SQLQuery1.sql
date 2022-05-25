USE SEDCACADEMYDB

CREATE TABLE [Student](
 [ID] [int] IDENTITY(1,1) NOT NULL,
 [FirstName] [nvarchar](100) NOT NULL,
 [LastName] [nvarchar](100) NOT NULL,
 [DateOfBirth] [date] NOT NULL,
 [EnrolledDate] [date] NOT NULL,
 [Gender] [nvarchar](6) NOT NULL,
 [NationalIDNumber] [int] NOT NULL,
 [StudentCardNumber] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED([Id] ASC)
 )

 CREATE TABLE [Teacher](
  [ID] [int] IDENTITY(1,1) NOT NULL,
  [FirstName] [nvarchar](100) NOT NULL,
  [LastName] [nvarchar](100) NOT NULL,
  [DateOfBirth] [date] NOT NULL,
  [AcademicRank] [int] NULL,
  [HireDate] [date] NOT NULL,
  CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED([Id] ASC)
 )

 CREATE TABLE [Grade](
 [ID] [int] IDENTITY(1,1) NOT NULL,
 [StudentID] [nvarchar] NOT NULL,
 [CourseID] [nvarchar] NULL,
 [TeacherID] [nvarchar] NOT NULL,
 [Grade] [nchar] NOT NULL,
 [Comment] [nvarchar] NULL,
 [CreatedDate] [date] NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED([Id] ASC)
 )

 CREATE TABLE [Course](
 [ID] [int] IDENTITY(1,1) NOT NULL,
 [Name] [nvarchar](100) NOT NULL,
 [Credit] [int](100) NOT NULL,
 [AcademicYear] [int] NOT NULL,
 [Semester] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED([Id] ASC)
 )

 CREATE TABLE [GradeDetails](
 [ID] [int] IDENTITY(1,1) NOT NULL,
 [GradeID] [int] NOT NULL,
 [AchievementID] [int] NOT NULL,
 [AchievementPoints] [int] NOT NULL,
 [AchievementMaxPoints] [int] NOT NULL,
 [AchievementDate] [date] NULL,
 CONSTRAINT [PK_GradeDetails] PRIMARY KEY CLUSTERED([Id] ASC)
 )

 CREATE TABLE [AchievementType](
 [ID] [int] IDENTITY(1,1) NOT NULL,
 [Name] [nvarchar] NOT NULL,
 [Description] [nvarchar] NULL,
 [ParticipationRate] [nvarchar] NOT NULL,
 CONSTRAINT [PK_AchievementType] PRIMARY KEY CLUSTERED([Id] ASC)
 )







