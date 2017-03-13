﻿/*You have to create the following queries. For each query, you need to use comment block to describe what data you are looking for. Below are requirements for each query:*/

USE Soylent;
GO
<<<<<<< HEAD
--1. Queries from all Tables-- 
Select * From Customers; 
Select * From Ingredients; 
Select * From Orders; 
Select * From Packages; 
Select * From Product; 
Select * From ProductIngredient; 
Select * From Subscription;
Select * From Suppliers;  
=======
>>>>>>> origin/master

/*Multiple SELECT * queries to display all the records from each table. (Suppose the database has 4 tables, you should create 4 queries for this requirement.)*/

SELECT *
FROM Product;

SELECT 


/*A query that uses aggregate function.*/


SELECT sum(TotalAmount) as SumOfTotalAmount, OrderDate
FROM Orders
GROUP BY OrderDate;

/*A query that selects records from two (or multiple) tables using INNER JOIN.*/

/*A query that selects records from two (or multiple) tables using LEFT OUTER JOIN (or RIGHT OUTER JOIN or FULL OUTER JOIN). Specify why outer join is neccesary in comment block. Make sure your fake data could reflect the necessary. If it could not, you need to go back to part 2 to redo the data insertion, or you can use INSERT INTO, UPDATE or DELETE statements to modify the existing data.*/

/*A query that uses subquery.*/

/*Add team name and names of team members in comment block.*/