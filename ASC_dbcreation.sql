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


-- Add a few Products
INSERT INTO Student (StudentID, FirstName, LastName) VALUES 
(1, 'Beong Jo', 'Kang'),
(2, 'Kelsey', 'Claflin'),
(3, 'Helena', 'Hernandez'),
(4, 'Upasana', 'Roy'),
(5, 'Waree', 'Rungsiriwat');

-- Add a few Ingredients (Clara)
<<<<<<< HEAD
INSERT INTO Ingredients (IngredientID, IngredientName, Flagged, SupplierID) VALUES
(1, 'SoyProtein', 'Yes', 001), 
(2, 'SunFlowerOil', 'Yes', 002), 
(3, 'Isomaltulose', 'Yes', 003), 
(4, 'Vitamin', 'No', 004), 
(5, 'Mineral', 'No', 005);
=======


>>>>>>> origin/master
-- Add a few Orders (Clara)
INSERT INTO Orders (OrderID, OrderDate, ShipDate, TotalAmount) VALUES 
(0001, 01-01-2017, 01-04-2017, '$55.00'),
(0002, 01-01-2017, 01-06-2017, '$23.00'),
(0003, 01-02-2017, 01-07-2017, '$44.00'), 
(0004, 01-03-2017, 01-08-2017, '$24.00'),
(0005, 01-04-2017, 01-09-2017, '$31.00');


-- Add a few Customers (Sukanya)
INSERT INTO Customers(CustomerID, FirstName, LastName, AddressComplete, ZipCode, StateUS, Country, Email, PhoneNumber, SubscriptionID) VALUES 
(1, 'Clara', 'Linanada', 'Campus Box #1443 231 Forest St.', '02457', 'MA', 'USA', 'clinanada1@babson.edu', '6263751779', '001'),
(2, 'Angela', 'Tsung', 'Campus Box #1442 231 Forest St.', '02457', 'MA', 'USA', 'atsung1@babson.edu', '6263751777', '002'),
(3, 'Sukanya', 'Mukherjee', 'Campus Box #1442 231 Forest St.', '02457', 'MA', 'USA', 'smukherjee4@babson.edu', '6263751778', '003'),
(4, 'Prabha', 'Dublish', 'Campus Box #1448 231 Forest St.', '02457', 'MA', 'USA', 'pdublish1@babson.edu', '6263751774', '004'),
(5, 'Tiffany', 'Shum', 'Campus Box #1440 231 Forest St.', '02457', 'MA', 'USA', 'tshum1@babson.edu', '6263751771', '005');

FirstName varchar(50) NOT NULL,
 LastName varchar(50) NOT NULL,
 AddressComplete varchar(50) NOT NULL,
 ZipCode varchar(50) NOT NULL,
 StateUS varchar(50) NOT NULL,
 Country varchar(50) NOT NULL,
 Email varchar(50) NOT NULL,
 PhoneNumber varchar(50) NOT NULL,
 SubscriptionID bigint NOT NULL);
-- Add a few Subscriptions (Sukanya)

 SubscriptionID bigint NOT NULL PRIMARY KEY, 
 StartDate date NOT  NULL, 
 EndDate date NOT NULL, 
Discount bigint NOT NULL,
CustomerID bigint NOT NULL);
-- Add a few Packages (Angela)

-- Add a few Suppliers (Angela)

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

