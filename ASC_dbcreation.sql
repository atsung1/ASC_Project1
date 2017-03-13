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
  CustomerID bigint NOT NULL);



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
Discount bigint NOT NULL);

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
SupplierAddress varchar (50) NOT NULL); 
-- create product-ingredient table,need two foreign keys 
CREATE TABLE ProductIngredient(
ProductID bigint NOT NULL, 
IngredientID bigint NOT NULL,
PRIMARY KEY (ProductID, IngredientID));
  -- Create the 2 FKs in product-ingredient table
ALTER TABLE ProductIngredient ADD CONSTRAINT FK_P
FOREIGN KEY (ProductID) REFERENCES Product(ProductID);
-- create the relationsihp: the first FK in orders
  ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Customers
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
-- create the relationship: the first FK in ingredient 
ALTER TABLE Ingredients ADD CONSTRAINT FK_Supplier1
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID);
-- create the relationship: the first FK in customers
ALTER TABLE Customers ADD CONSTRAINT FK_SubsriptionID
FOREIGN KEY (SubscriptionID) REFERENCES Subscription(SubscriptionID);
-- create the relationship: the first FK in packages
  ALTER TABLE Packages ADD CONSTRAINT FK_Packages_Product
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID);
;

GO


-- Add a few Products
INSERT INTO Product (ProductID, ProductName, ProductCategory) VALUES 
(1, 'Original Drink', 'Drink'),
(2, 'Nectar Drink', 'Drink'),
(3, 'Cacao Drink', 'Drink'),
(4, 'Coffiest', 'Coffiest'),
(5, 'Soylent Powder', 'Powder'),
(6, 'Airtight Pitcher', 'Prep'),
(7, 'Cacao Bar', 'Bar'),
(8, 'Raspberry Bar', 'Bar'),
(9, 'Caramel Bar', 'Bar'),
(10, 'Coffee Bar', 'Bar');

-- Add a few Suppliers (Angela)
INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, PhoneNumber, SupplierAddress) VALUES 
(1, 'IsomalCo', 'Andrei Volkov', 6174958978, '213 Forest St, Babson Park, MA 02457'),
(2, 'SoyBeanCo', 'Zhi Li', 6828757483, '123 Rainbow St, San Francisco, CA 91434'),
(3, 'ProteinCo', 'Mary Brown', 1025943658, '567 Unicorn St, Los Angeles, CA 90024'),
(4, 'CocoCo', 'John Smith', 1363875763, '951 Babson College Drive, Wellesley, MA 02457'),
(5, 'PowderCo', 'Ben Franklin', 3448576958, '373 Camelbak Rd, New York City, NY, 12584'),
(6, 'SunflowerCo', 'Steve Jobs', 8374947254, '12 FlowerSt, Albany, NY, 29845'),
(7, 'VitaminCo', 'John Adams', 8364749475, '456 Vita Rd, Boston, MA, 02748'),
(8, 'OilCo', 'Jane Doe', 0126480173, '8384 Oil St, Reno, NV, 83927'),
(9, 'CoffeeCo', 'Bobby White', 1083529563, '837 Coffee Rd, New York City, NY, 12584'),
(10, 'MineralCo', 'George Washington', 0285380533, '92 Mineral Rd, New York City, NY, 12592');

-- Add a few Ingredients (Clara)
INSERT INTO Ingredients (IngredientID, IngredientName, Flagged, SupplierID) VALUES
(1, 'SoyProtein', 'Yes', 1), 
(2, 'SunFlowerOil', 'Yes', 2), 
(3, 'Isomaltulose', 'Yes', 3), 
(4, 'VitaminA', 'No', 4), 
(5, 'Mineral', 'No', 5),
(6, 'VitaminB', 'No', 6),
(7, 'VitaminC', 'No', 7),
(8, 'VitaminD', 'No', 8), 
(9, 'VitaminE', 'No', 9),
(10, 'Aqua', 'No', 10);

-- Add a few Subscriptions (Sukanya)
INSERT INTO Subscription(SubscriptionID, StartDate, EndDate, Discount) VALUES 
(1, '2017-03-11', '2018-03-11', 5),
(2, '2017-03-10', '2018-03-10', 5),
(3, '2017-01-11', '2018-01-11', 5),
(4, '2017-02-11', '2018-02-11', 5),
(5, '2017-01-10', '2018-01-10', 5),
(6, '2017-01-21', '2018-01-21', 5),
(7, '2017-03-12', '2018-03-12', 5),
(8, '2017-01-04', '2018-01-04', 5),
(9, '2017-01-25', '2018-01-26', 5),
(10, '2017-01-16', '2018-01-16', 5);



-- Add a few Customers (Sukanya)
INSERT INTO Customers (CustomerID, FirstName, LastName, AddressComplete, ZipCode, StateUS, Country, Email, PhoneNumber, SubscriptionID) VALUES 
(1, 'Clara', 'Linanada', 'Campus Box #1443 231 Forest St.', '02457', 'MA', 'USA', 'clinanada1@babson.edu', '6263751779', 1),
(2, 'Angela', 'Tsung', 'Campus Box #1442 231 Forest St.', '02457', 'MA', 'USA', 'atsung1@babson.edu', '6263751777', 2),
(3, 'Sukanya', 'Mukherjee', 'Campus Box #1442 231 Forest St.', '02457', 'MA', 'USA', 'smukherjee4@babson.edu', '6263751778', 3),
(4, 'Prabha', 'Dublish', 'Campus Box #1448 231 Forest St.', '02457', 'MA', 'USA', 'pdublish1@babson.edu', '6263751774', 4),
(5, 'Tiffany', 'Shum', 'Campus Box #1440 231 Forest St.', '02457', 'MA', 'USA', 'tshum1@babson.edu', '6263751771', 5),
(6, 'Sarah', 'Liu', 'Campus Box #1423 231 Forest St.', '02457', 'MA', 'USA', 'sliu9@babson.edu', '6263219131', 6),
(7, 'Guadalupe', 'Carino', 'Campus Box #1420 231 Forest St.', '02457', 'MA', 'USA', 'gcarino1@babson.edu', '6261223451', 7),
(8, 'Tim', 'Brown', 'Campus Box #1140 231 Forest St.', '02457', 'MA', 'USA', 'tbrown1@babson.edu', '626371341', 8),
(9, 'Angel', 'Seto', 'Campus Box #1540 231 Forest St.', '02457', 'MA', 'USA', 'aseto1@babson.edu', '6262751771', 9),
(10, 'Abdi', 'Bal', 'Campus Box #1410 231 Forest St.', '02457', 'MA', 'USA', 'abal1@babson.edu', '6263731771', 10);

-- Add a few Orders (Clara)
INSERT INTO Orders (OrderID, OrderDate, ShipDate, TotalAmount, CustomerID) VALUES 
(0001, '2017-01-01', '2017-01-04', 55.00, 1),
(0002, '2017-01-01', '2017-01-06', 23.00, 2),
(0003, '2017-01-02', '2017-01-07', 44.00, 3), 
(0004, '2017-01-03', '2017-01-08', 24.00, 4),
(0005, '2017-01-04', '2017-01-09', 31.00, 5),
(0006, '2017-01-05', '2017-01-10', 37.00, 6),
(0007, '2017-01-06', '2017-01-11', 22.00, 7), 
(0008, '2017-01-07', '2017-01-12', 58.00, 8),
(0009, '2017-01-08', '2017-01-13', 82.00, 9),
(0010, '2017-01-09', '2017-01-15', 41.00, 10);

-- Add a few Packages (Angela)
INSERT INTO Packages (PackageID, PackageSize, Price, ProductID) VALUES 
(1, 12, 34, 5),
(2, 24, 68, 4),
(3, 36, 102, 3),
(4, 48, 136, 2),
(5, 60, 170, 1),
(6, 72, 204, 6),
(7, 84, 238, 7),
(8, 96, 272, 8),
(9, 108, 306, 9),
(10, 120, 340, 10);

GO