CREATE DATABASE Soylent;
GO

USE Soylent;
GO

-- Create the customer and order tables
CREATE TABLE Product(
  ProductID bigint NOT NULL PRIMARY KEY,
  ProductName varchar(50) NOT NULL,
  ProductCategory varchar(50) NOT NULL,
  IngredientID bigint NOT NULL);

CREATE TABLE Ingredients(
  IngredientID bigint NOT NULL PRIMARY KEY,
  IngredientName varchar(50) NOT NULL,
  Flagged varchar(50) NOT NULL,
  SupplierID bigint NOT NULL);


CREATE TABLE Orders(
  OrderID bigint NOT NULL PRIMARY KEY,
  OrderDate bigint NOT NULL,
  ShipDate bigint NOT NULL,
  TotalAmount bigint NOT NULL,
  CustomerID bigint NOT NULL,
  SubscriptionID bigint NOT NULL);



  CREATE TABLE Customers(
CustomerID bigint NOT NULL PRIMARY KEY,
 FirstName varchar(50) NOT NULL,
 LastName varchar(50) NOT NULL,
 AddressComplete varchar(50) NOT NULL,
 ZipCode varchar(50) NOT NULL,
 StateUS varchar(50) NOT NULL,
 Country varchar(50) NOT NULL,
 Email varchar(50) NOT NULL,
 PhoneNumber varchar(50) NOT NULL,
 SubscriptionID bigint NOT NULL);


 CREATE TABLE Subscription(
 SubscriptionID bigint NOT NULL PRIMARY KEY, 
 StartDate date NOT  NULL, 
 EndDate date NOT NULL, 
Discount bigint NOT NULL,
CustomerID bigint NOT NULL);

CREATE TABLE Packages(
PackageID bigint NOT NULL PRIMARY KEY, 
PackageSize bigint NOT NULL, 
Price bigint NOT NULL,
ProductID bigint NOT NULL);

CREATE TABLE Suppliers(
SupplierID bigint NOT NULL PRIMARY KEY,
SupplierName varchar (50) NOT NULL,
ContactName varchar (50) NOT NULL,
PhoneNumber bigint NOT NULL, 
SupplierAddress varchar (50) NOT NULL,
IngredientID bigint NOT NULL); 
-- create product-ingredient table,need two foreign keys 
CREATE TABLE ProductIngredient(
ProductID bigint NOT NULL, 
IngredientID bigint NOT NULL,
PRIMARY KEY (ProductID, IngredientID));
  -- Create the 2 FKs in product-ingredient table
ALTER TABLE ProductIngredient ADD CONSTRAINT FK_P
FOREIGN KEY (ProductID) REFERENCES Product(ProductID);
  -- Create the relationship: the first FK in Product
ALTER TABLE ProductIngredient ADD CONSTRAINT FK_I 
FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID);


  -- Create the relationship: the first FK in Product
ALTER TABLE Product ADD CONSTRAINT FK_1 
FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID);
-- create the relationsihp: the first FK in orders
  ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Customers
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
<<<<<<< HEAD
=======


>>>>>>> origin/master
  -- create the relationship: the second FK in orders
  ALTER TABLE Orders ADD CONSTRAINT FK_Subscription_Discount
  FOREIGN KEY (SubscriptionID) REFERENCES Subscription(SubscriptionID);
-- create the relationship: the first FK in ingredient 
ALTER TABLE Ingredients ADD CONSTRAINT FK_Supplier1
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID);

-- create the relationship: the first FK in customers
ALTER TABLE Customers ADD CONSTRAINT FK_SubsriptionID
FOREIGN KEY (SubscriptionID) REFERENCES Subscription(SubscriptionID);


-- create the relationship: the first FK in subscription
  ALTER TABLE Subscription ADD CONSTRAINT FK_Subscription_Customers
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
-- create the relationship: the first FK in packages
  ALTER TABLE Packages ADD CONSTRAINT FK_Packages_Product
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID);
-- create the relationship: the first FK in suppliers
  ALTER TABLE Suppliers ADD CONSTRAINT FK_Suppliers_Ingredients
  FOREIGN KEY (IngredientID) REFERENCES Ingredients(IngredientID);

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

