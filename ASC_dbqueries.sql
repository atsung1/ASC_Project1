USE Soylent;
<<<<<<< HEAD
GO
<<<<<<< HEAD
=======
GO  

>>>>>>> origin/master
/*Multiple SELECT * queries to display all the records from each table. (Suppose the database has 4 tables, you should create 4 queries for this requirement.)*/
Select * From Customers; 
Select * From Ingredients; 
Select * From Orders; 
Select * From Packages; 
Select * From Product; 
Select * From ProductIngredient; 
Select * From Subscription;
Select * From Suppliers;  
<<<<<<< HEAD


SELECT *
FROM Product;

SELECT 

=======
>>>>>>> origin/master

/*A query that uses aggregate function.*/
SELECT sum(TotalAmount) as SumOfTotalAmount, OrderDate
FROM Orders
GROUP BY OrderDate;

/*A query that selects records from two (or multiple) tables using INNER JOIN.*/
SELECT a.ProductID, a.ProductName, a.ProductCategory, b.PackageID, b.PackageSize, b.Price
FROM Product as a INNER JOIN Packages as b
ON a.ProductID=b.ProductID;

/*A query that selects records from two (or multiple) tables using LEFT OUTER JOIN (or RIGHT OUTER JOIN or FULL OUTER JOIN). Specify why outer join is neccesary in comment block. Make sure your fake data could reflect the necessary. If it could not, you need to go back to part 2 to redo the data insertion, or you can use INSERT INTO, UPDATE or DELETE statements to modify the existing data.*/
/*Outer join is necessary when we need all of the rows from one of the tables. For example, We have more products than there are packages, and not every product translates to a line in Packages. Thus, in this query, we want to show all the products and the packages associated with it, while still including the products without packages.*/
INSERT INTO Product (ProductID, ProductName, ProductCategory) VALUES (11, 'Strawberry Powder', 'Powder');
SELECT a.ProductID, a.ProductName, a.ProductCategory, b.PackageID, b.PackageSize, b.Price
FROM Product as a LEFT OUTER JOIN Packages as b
ON a.ProductID=b.ProductID;

/*A query that uses subquery.*/
SELECT OrderID, OrderDate, CustomerID, TotalAmount
FROM Orders
WHERE TotalAmount>(SELECT AVG(TotalAmount) FROM Orders);

/*Team Name:ASC
Team Members: Clara Linanda, Sukanya Mukherjee, Angela Tsung*/