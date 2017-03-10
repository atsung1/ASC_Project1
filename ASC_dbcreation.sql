CREATE DATABASE Soylent;
GO

USE Soylent;
GO

-- Create the customer and order tables
CREATE TABLE Product(
  ProductID bigint NOT NULL PRIMARY KEY,
  ProductName varchar(50) NOT NULL,
  ProductCategory varchar(50) NOT NULL);

CREATE TABLE Ingredients(
  CourseID bigint NOT NULL PRIMARY KEY,
  CourseTitle varchar(50) NOT NULL,
  Instuctor varchar(50) NOT NULL);

CREATE TABLE Orders(
  OrderID bigint NOT NULL PRIMARY KEY,
  OrderDate bigint NOT NULL,
  ShipDate bigint NOT NULL,
  TotalAmount bigint NOT NULL);

  CREATE TABLE Customers(
CustomerID bigint NOT NULL PRIMARY KEY,
 FirstName varchar(50) NOT NULL,
 LastName varchar(50) NOT NULL,
 AddressComplete varchar(50) NOT NULL,
 ZipCode varchar(50) NOT NULL,
 StateUS varchar(50) NOT NULL,
 Country varchar(50) NOT NULL,
 Email varchar(50) NOT NULL,
 PhoneNumber varchar(50) NOT NULL);

 CREATE TABLE Subscription(
 SubscriptionID bigint NOT NULL PRIMARY KEY, 
 StartDate date NOT  NULL, 
 EndDate date NOT NULL, 
Discount bigint NOT NULL);

-- Create the relationship: the first FK in CourseEnrollment
ALTER TABLE CourseEnrollment ADD CONSTRAINT FK_CourseEnrollment_Student 
FOREIGN KEY (StudentId) REFERENCES Student(StudentID);
GO

-- We will use designer view to create another relationship: the second FK in CourseEnrollment


-- Add a few students
INSERT INTO Student (StudentID, FirstName, LastName) VALUES 
(1, 'Beong Jo', 'Kang'),
(2, 'Kelsey', 'Claflin'),
(3, 'Helena', 'Hernandez'),
(4, 'Upasana', 'Roy'),
(5, 'Waree', 'Rungsiriwat'),
(6, 'Shazeem', 'Siddiqi'),
(7, 'Connie', 'Li'),
(8, 'Hunter', 'Schilb'),
(9, 'Angela', 'Tsung'),
(10, 'David', 'Butsko');


-- Add a few courses
INSERT INTO Course(CourseID, CourseTitle, Instuctor) VALUES 
(1, 'MIS3545-BUSINESS INTELLIGENCE AND DATA ANALYTICS', 'Zhi'),
(2, 'MIS3690-WEB TECHNOLOGIES', 'Shankar'),
(3, 'QTM3000-CASE STUDIES IN BUSINESS ANALYTICS', 'Nathan'),
(4, 'QTM3625-FINANCIAL SIMULATION', 'Dessi'),
(5, 'SME2012-MANAGING INFORMATION TECH AND SYSTEMS', 'Clare');
GO

-- Delete the SME course
DELETE FROM Course
WHERE CourseTitle like 'SME%';
GO 


-- We will use data view to add grade data


-- Some queries
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM CourseEnrollment;

GO

-- Create a handy view summarizing students' grades
CREATE VIEW vwStudentGradeSummary WITH SCHEMABINDING AS
 SELECT
   s.StudentID, s.FirstName, s.LastName, 
   ISNULL(COUNT(ce.CourseID), 0) AS NumberOfCourses,
   ISNULL(SUM(ce.Grade), 0) AS TotalGrade
  FROM
   dbo.Student AS s
   LEFT OUTER JOIN dbo.CourseEnrollment AS ce ON s.StudentID = ce.StudentId
  GROUP BY
   s.StudentID, s.FirstName, s.LastName
GO


SELECT * FROM vwStudentGradeSummary;

