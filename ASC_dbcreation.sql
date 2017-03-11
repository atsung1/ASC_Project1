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
  IngredientID bigint NOT NULL PRIMARY KEY,
  IngredientName varchar(50) NOT NULL,
  Flagged varchar(50) NOT NULL,
  SupplierID bigint NOT NULL);


CREATE TABLE Orders(
  OrderID bigint NOT NULL PRIMARY KEY,
  OrderDate date NOT NULL,
  ShipDate date NOT NULL,
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
 StartDate date NOT NULL, 
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
INSERT INTO Product (ProductID, ProductName, ProductCategory) VALUES 
(1, 'Original Drink', 'Drink'),
(2, 'Nectar Drink', 'Drink'),
(3, 'Cacao Drink', 'Drink'),
(4, 'Coffiest', 'Coffiest'),
(5, 'Soylent Powder', 'Powder');

-- Add a few Ingredients (Clara)
INSERT INTO Ingredients (IngredientID, IngredientName, Flagged, SupplierID) VALUES
(1, 'SoyProtein', 'Yes', 1), 
(2, 'SunFlowerOil', 'Yes', 2), 
(3, 'Isomaltulose', 'Yes', 3), 
(4, 'Vitamin', 'No', 4), 
(5, 'Mineral', 'No', 5);

-- Add a few Orders (Clara)
INSERT INTO Orders (OrderID, OrderDate, ShipDate, TotalAmount) VALUES 
(0001, 2017-01-01, 2017-01-04, 55.00),
(0002, 2017-01-01, 2017-01-06, 23.00),
(0003, 2017-01-02, 2017-01-07, 44.00), 
(0004, 2017-01-03, 2017-01-08, 24.00),
(0005, 2017-01-04, 2017-01-09, 31.00);


-- Add a few Customers (Sukanya)
INSERT INTO Customers(CustomerID, FirstName, LastName, AddressComplete, ZipCode, StateUS, Country, Email, PhoneNumber, SubscriptionID) VALUES 
(1, 'Clara', 'Linanada', 'Campus Box #1443 231 Forest St.', '02457', 'MA', 'USA', 'clinanada1@babson.edu', '6263751779', 1),
(2, 'Angela', 'Tsung', 'Campus Box #1442 231 Forest St.', '02457', 'MA', 'USA', 'atsung1@babson.edu', '6263751777', 2),
(3, 'Sukanya', 'Mukherjee', 'Campus Box #1442 231 Forest St.', '02457', 'MA', 'USA', 'smukherjee4@babson.edu', '6263751778', 3),
(4, 'Prabha', 'Dublish', 'Campus Box #1448 231 Forest St.', '02457', 'MA', 'USA', 'pdublish1@babson.edu', '6263751774', 4),
(5, 'Tiffany', 'Shum', 'Campus Box #1440 231 Forest St.', '02457', 'MA', 'USA', 'tshum1@babson.edu', '6263751771', 5);

-- Add a few Subscriptions (Sukanya)
INSERT INTO Subscription(SubscriptionID, StartDate, EndDate, Discount, CustomerID) VALUES 
(1, 2017-03-11, 2018-03-11, 5, 1),
(2, 2017-03-10, 2018-03-10, 5, 2),
(3, 2017-01-11, 2018-01-11, 5, 3),
(4, 2017-02-11, 2018-02-11, 5, 4),
(5, 2017-01-10, 2018-01-10, 5, 5);

-- Add a few Packages (Angela)
INSERT INTO Packages (PackageID, PackageSize, Price, ProductID) VALUES 
(1, 12, 34, 5),
(2, 24, 68, 4),
(3, 36, 102, 3),
(4, 48, 136, 2),
(5, 60, 34, 1);
-- Add a few Suppliers (Angela)
INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, PhoneNumber, SupplierAddress, IngredientID) VALUES 
(1, 'WheatThins', 'Andrei Volkov', 6174958978, '213 Forest St, Babson Park, MA 02457', 5 ),
(2, 'SoyBeanCo', 'Zhi Li', 6828757483, '123 Rainbow St, San Francisco, CA 91434', 4),
(3, 'Kraft', 'Mary Brown', 1025943658, '567 Unicorn St, Los Angeles, CA 90024', 3),
(4, 'CocoCo', 'John Smith', 1363875763, '951 Babson College Drive, Wellesley, MA 02457', 2),
(5, 'PowderCo', 'Ben Franklin', 3448576958, '373 Camelbak Rd, New York City, NY, 12584', 1);
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

