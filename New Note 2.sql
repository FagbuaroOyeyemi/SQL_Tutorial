--New Note
--There are 3 types of data: Structured data, Semi structured data and Unstructured data.

--Retrieveing data from the Customers table.
SELECT *  --Asterisks means all in SQL
FROM dbo.Customers;

SELECT CustomerID, CompanyName, ContactName, City
FROM dbo.Customers;

--Retrieve City, Address, Region from the Customers table
SELECT City, Address, Region 
FROM dbo.Customers;

--Aliasing in SQL
--Aliasing is a way of renaming columns in SQL. AS keyword is used to Alias in SQL
SELECT City, Address, Region  region_in_customers_table
FROM dbo.Customers;

SELECT City, Address, Region AS region_in_customers_table
FROM dbo.Customers;

SELECT City, Address ,Region
FROM dbo.Customers;

SELECT *
FROM dbo.Orders;

--Retrieve the OrderID,Orderdate, RequiredDate, ShippedDate from the Orders table
SELECT OrderID, OrderDate, RequiredDate, ShippedDate 
FROM dbo.Orders;

--Filtering data in SQL. 
--WE use the WHERE clause to Filter data in SQL

SELECT *
FROM dbo.Orders
WHERE EmployeeID = 4;

--When you want to specify multiple criteria from a single column, you use the IN keyword with WHERE clause
--Retrieve the orders from London, Madrid, Marseille
SELECT OrderID, CustomerID, Freight, ShipName, ShipCity
FROM dbo.Orders
WHERE ShipCity IN ('London', 'Madrid', 'Marseille');

--Using the AND, OR, NOT, <,>,<=,>= with the WHERE CLAUSE to filter data.
--Retrieve all orders from London, Madrid and Marseille that are handled by employeeID 1
SELECT *
FROM dbo.Orders
WHERE (employeeID = 1) AND ShipCity IN ('London', 'Madrid','Marseille');

--AND keyword 
SELECT *
FROM dbo.Customers;

--Retrieve CustomerID, CompanyName, Address of all customers whose contacttitle is owner and city is Portland
SELECT CustomerID, CompanyName, Address, ContactTitle, City
FROM dbo.Customers
WHERE ContactTitle = 'Sales Representative' AND City = 'London';

SELECT CustomerID, CompanyName, Address, ContactTitle, City
FROM dbo.Customers
WHERE ContactTitle = 'Sales Representative' OR City = 'London';

--NOT is represented as != in SQL 
SELECT *
FROM dbo.Customers 
WHERE City != 'Berlin';

--NOT IN
SELECT *
FROM dbo.Customers
WHERE City NOT IN ('London', 'Berlin');

SELECT *
FROM dbo.Employees

--Classwork
--Retrieve the details of all employees that come from Seattle and WA region
--Retrieve the OrderID, CustomerID, OrderDate, Freight of all orders whose freight is between 10.00 and 60.00
--Retrieve the details of all customers that live outside Marseille


SELECT *
FROM dbo.Employees
WHERE  (City = 'Seattle') AND (Region = 'WA');


SELECT OrderID, CustomerID, OrderDate, Freight 
FROM dbo.Orders
WHERE Freight BETWEEN 10.00 AND 60.00;

SELECT OrderID, CustomerID, OrderDate, Freight 
FROM dbo.Orders
WHERE (Freight >= 10.00) AND (Freight <= 60.00);

SELECT *
FROM dbo.Customers
WHERE City != 'Marseille';


SELECT *
FROM dbo.orders;

--Retrieve all orders between February 1996 and April 1998
--Retrieve the list of all customers in London and Berlin
--Retrieve the List of all Cities in the Customers table

SELECT *
FROM dbo.Orders
WHERE OrderDate BETWEEN 'February 1996' AND 'April 1998';

SELECT *
FROM dbo.Orders
WHERE OrderDate BETWEEN '1996-02-01 00:00:00.000' AND '1998-04-01 00:00:00.000';


SELECT *
FROM dbo.Customers
WHERE City IN ('London','Berlin');


SELECT City 
FROM dbo.Customers;

--Distinct Function
--Distinct function is used to eliminate duplicates from the result set. 
SELECT DISTINCT City
FROM dbo.Customers;

SELECT *
FROM dbo.Employees;

SELECT DISTINCT LastName, FirstName
FROM dbo.Employees;

--Sorting in SQL
--Sorting is used to rearrange the result set. in SQL, the ORDER BY Function is used to sort the result set.
--The ORDER BY function is used with either ASC or DESC
--ASC is used to sort in ascending order, DESC is used to sort in descending order

SELECT  FirstName, LastName
FROM dbo.employees 
ORDER BY FirstName ;


SELECT  FirstName, LastName,City, Address
FROM dbo.employees 
ORDER BY FirstName DESC, LastName;

SELECT *
FROM dbo.[Order Details];

--Retrieve the Orders with the highest UnitPrice
SELECT OrderID,ProductID, UnitPrice
FROM dbo.[Order Details]
ORDER BY UnitPrice DESC;

--Top function in SQL
--Retrieve top 10 productid with the highest unit price
SELECT DISTINCT TOP 10  ProductID, UnitPrice
FROM dbo.[Order Details]
ORDER BY UnitPrice DESC;

--Retrieve the productID with the least unit price 


SELECT  DISTINCT TOP 10 ProductID, UnitPrice 
FROM dbo.[Order Details]
ORDER BY UnitPrice ASC;

--Retrieve the top 20 orders between April 1996 and April 1998 with the least freight
--Retrieve a properly arranged  employees information
--Retrieve an arranged customer information in London,Madrid, Nantes and whose contacttiles are Owner and Sales representrative


SELECT DISTINCT TOP 20 Freight, OrderID, CustomerID, OrderDate
FROM dbo.Orders
WHERE OrderDate BETWEEN 'April 1996' AND 'April 1998'
ORDER BY Freight ASC;


SELECT TOP 20  OrderID, CustomerID, OrderDate, Freight
FROM dbo.Orders
WHERE OrderDate BETWEEN 'April 1996' AND 'April 1998'
ORDER BY Freight ASC;


SELECT *
FROM dbo.Employees
ORDER BY FirstName ASC;


SELECT *
FROM dbo.Employees
ORDER BY EmployeeID;

SELECT *
FROM dbo.Customers
WHERE City IN ('London','Madrid','Nantes') AND ContactTitle IN ('Owner','Sales Representative')
ORDER BY ContactName ASC;


--Wildcards in SQL
--Wildcards are used with the LIKE operator to search for specified pattern in a column
--There are two main wildcards in SQL. they are percentage sign(%) and the Underscore(_)
--% represents Zero, one or multiple characters
-- _ sign represents a single character



SELECT *
FROM dbo.Customers;

SELECT *
FROM dbo.Customers
WHERE CompanyName LIKE 'Joe%';

SELECT *
FROM dbo.Customers
WHERE ContactName LIKE '%ma%';

SELECT *
FROM dbo.Customers
WHERE CompanyName LIKE '%land%';

SELECT *
FROM dbo.Customers
WHERE ContactName LIKE 'Yemi%';

SELECT *
FROM dbo.Customers
WHERE CompanyName LIKE 'A%'

SELECT *
FROM dbo.Customers
WHERE ContactName LIKE '_emi Osinbajo';

SELECT *
FROM dbo.Customers
WHERE CompanyName LIKE 'J__ Biden ';

--NOT LIKE Operator
--NOT LIKE Operator is used with the Wildcards in the WHERE Clause to exclude rows that match a specified pattern. 
SELECT *
FROM dbo.Customers
WHERE CompanyName  NOT LIKE 'A%'
ORDER BY CompanyName ASC;

--NULL values
--We use the IS NULL function to retrieve null values from our dataset.

SELECT CustomerID, ContactName, ContactTitle, Address,City, Region, Postalcode, Country,Phone, Fax1, Email
FROM dbo.Customers
WHERE Address IS NULL AND
City IS NULL AND
Region IS NULL AND
PostalCode is NULL AND
Country IS NULL AND
Phone IS NULL AND
Fax1 IS NULL AND
Email is NULL;


SELECT *
FROM dbo.Orders;

SELECT COUNT(*)Number_of_null_shipregion
FROM dbo.Orders
WHERE ShipRegion IS NULL;

--IS NOT NULL
SELECT *
FROM dbo.Customers
WHERE Region IS NOT NULL


SELECT *
FROM dbo.Customers
ORDER BY Region ASC;


SELECT *
FROM dbo.Customers
WHERE Address IS NULL AND Region IS NULL ;

--How to retrieve null values from every column in a single select statement


--Aggregate functions, Group By function and Having Function in SQL
--The Aggregate functions in SQL are SUM, COUNT, AVG, MIN and MAX
SELECT *
FROM dbo.Orders;

SELECT SUM(Freight) AS sum_of_freight
FROM dbo.Orders;

SELECT SUM(Freight) sum_of_freight
FROM dbo.Orders;


SELECT COUNT(OrderID)
FROM dbo.Orders;

--Count Distinct
SELECT COUNT(DISTINCT OrderID) AS number_of_Orders
from dbo.Orders;

SELECT AVG(Freight) AS average_freight
FROM dbo.Orders;

SELECT MIN(Freight) AS minimum_freight
FROM dbo.Orders;

SELECT MAX(Freight) AS maximum_freight
FROM dbo.Orders;


--Groupby function is used to group rows that have same values in specified columns
--It is used to organize data into groups for aggregation.
--Every unaggregated column that is specified in the select statemnet together with an aggregated column must be in the groupby clause
SELECT CustomerID, COUNT(DISTINCT OrderID) AS number_of_orders, SUM(Freight) AS total_freight
FROM dbo.Orders
GROUP BY CustomerID
ORDER BY COUNT(DISTINCT OrderID);


SELECT *
FROM dbo.[Order Details];

SELECT OrderID, COUNT(DISTINCT ProductID) AS Number_of_products, Quantity, Discount
FROM dbo.[Order Details]
GROUP BY OrderID, Quantity, Discount;

--Having  Function
SELECT OrderID, SUM(Freight) total_freight
FROM dbo.Orders
GROUP BY OrderID
HAVING SUM(Freight) BETWEEN 10.00 AND 60.00;

--Retrieve the list of all Territories in the territories table
--Count the number of customers in each region and each city
--Retrieve the total revenue generated from each orders and the product IDs of the products ordered
--Count the number of employees from each region
--Get the total unit price for all products 
--Retrieve the list of all orders whose freight does not exceed 60.00

SELECT DISTINCT TerritoryDescription
FROM dbo.Territories;


SELECT *
FROM dbo.Customers;

SELECT COUNT(DISTINCT CustomerID) AS Customer_strength, City, Region
FROM dbo.Customers
GROUP BY City, Region
ORDER BY Customer_Strength DESC;

SELECT DISTINCT Region, City, COUNT(DISTINCT CustomerID) AS Customer_strength
FROM dbo.Customers
GROUP BY Region, city
ORDER BY Customer_strength DESC;

SELECT SUM((UnitPrice * Quantity)- Discount) AS total_revenue, OrderID, ProductID
FROM dbo.[Order Details]
GROUP BY OrderID, ProductID;

SELECT DISTINCT OrderID, ProductID, ROUND(SUM((UnitPrice * Quantity)- Discount),2) AS total_revenue, SUM((UnitPrice*Quantity)-Discount) 
FROM dbo.[Order Details]
GROUP BY OrderID, ProductID;


SELECT OrderID, ProductID, ((UnitPrice * Quantity)- Discount) AS total_revenue
FROM dbo.[Order Details]
GROUP BY OrderID, ProductID, UnitPrice, Quantity, Discount;

SELECT Region ,COUNT(DISTINCT EmployeeID) AS number_of_employees 
FROM dbo.Employees
GROUP BY Region;

SELECT DISTINCT ProductID, ProductName, SUM(UnitPrice) AS Total_unitprice
FROM dbo.Products
GROUP BY ProductID, ProductName
ORDER BY Total_UnitPrice DESC;

SELECT DISTINCT ProductID, ProductName, SUM(UnitPrice) AS Total_unitprice
FROM dbo.Products
GROUP BY ProductID, ProductName
ORDER BY Total_UnitPrice DESC; 

SELECT OrderID, Freight
FROM dbo.Orders
WHERE Freight <= 60.00
ORDER BY Freight;


--Case Statement
--Case statement is a conditional function in SQL.
SELECT *
FROM dbo.Orders;

SELECT  OrderID, OrderDate, Freight,
CASE
    WHEN Freight <= 20.00 THEN 'Low Freight'
	WHEN Freight > 20.00  AND Freight <= 50.00 THEN 'Normal Freight'
	WHEN Freight > 50.00 THEN 'High Freigt'
	ELSE 'Abnormal' 
END AS Freight_Category
FROM dbo.Orders;


SELECT CustomerID, COUNT(OrderID) AS OrderCount,
CASE
	WHEN COUNT(OrderID) >=15 THEN 'Frequent Customers'
	WHEN COUNT(OrderID) BETWEEN 5 AND 14 THEN 'Occasional Customers'
	ELSE 'Rare'
END AS Customer_Category
FROM dbo.Orders
GROUP BY CustomerID;

SELECT *
FROM dbo.Customers;

--Retrieve the list of all the continents that the company has expanded to and Count the number of customers in each country and Continent. 
SELECT *
FROM dbo.Customers;

SELECT DISTINCT Country
FROM dbo.customers;

SELECT COUNT(CustomerID) AS Number_of_Customers,Country,
CASE
	WHEN Country IN ('Austria','Belgium','Denmark','Finland','France','Germany','Ireland','Italy','Norway',
	                 'Poland','Portugal','Spain','Sweden','Switzerland','UK') THEN 'Europe'
	WHEN Country IN ('Argentina','Brazil','Mexico','Venezuela') THEN 'South America'
	WHEN Country = 'Nigeria' THEN 'Africa'
	WHEN Country IN ('Canada', 'USA') THEN 'North America'
END AS Continents
FROM dbo.Customers
GROUP BY Country
ORDER BY Number_of_Customers DESC;


--JOINS in SQL
--Joins is used to combine two or more tables together.
--There are seven types of join. They are INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, SELF JOIN
--Cartesian (CROSS) JOIN, Anti Join

--Inner Join : An Inner join returns rows when there is a match in both tables. if there's no match, the row is not included

--Left Join: A left join returns all rocords from the left table and the matched records from the right table.
   --If there is no match, NULL values are returned from the right table.

--Right Join: A right join returns all records from the right table and the matched records from the left table.
   --if there is no match, NULL values are returned from the left table.

--FULL Outer Join: A full outer join returns all rows where there is a match in either table. If there is no match, NULL
   --is returned for columns from the table that lacks a matching row.

--Cross Join: A cross join returns the product of two tables, meaning it returns all possible combinations of rows between two table.

--Anti Join: An Anti Join returns all records from one table where there is no match in the other table

--Self Join: A self join is a type in which a table is joined with itself.

--INNER JOIN
--Retrieve the list of customers who have placed at least one order.

SELECT * FROM dbo.Customers;
SELECT * FROM dbo.Orders;

SELECT a.CustomerID, a.CompanyName, a.Address, b.OrderID, b.OrderDate, a.Country
FROM dbo.Customers AS a
INNER JOIN dbo.Orders  AS b
ON a.CustomerID = b.CustomerID;

SELECT dbo.Customers.CustomerID, dbo.Customers.CompanyName, dbo.Customers.Address, dbo.Orders.OrderID, dbo.Orders.OrderDate, dbo.Customers.Country
FROM dbo.Customers 
INNER JOIN dbo.Orders  
ON dbo.Customers.CustomerID = dbo.Orders.CustomerID;

--Retrieve all orders and the employees that handled the orders between April and December 1997
SELECT * FROM dbo.Orders;
SELECT * FROM dbo.employees;

SELECT a.OrderID, a.CustomerID, a.EmployeeID, a.OrderDate, a.ShippedDate, a.ShipName, 
       b.FirstName, b.LastName, b.Title, b.Address, b.City, b.Region
FROM dbo.Orders AS a
 INNER JOIN dbo.employees AS b
ON a.EmployeeID = b.EmployeeID
WHERE a.OrderDate BETWEEN '1997-04-01 00:00:00.000' AND '1997-12-31 00:00:00.000';

--Left Join
SELECT a.CustomerID, a.CompanyName, a.Address, b.OrderID, b.OrderDate, a.Country
FROM dbo.Customers AS a
LEFT JOIN dbo.Orders  AS b
ON a.CustomerID = b.CustomerID;

SELECT a.OrderID, a.CustomerID, a.EmployeeID, a.OrderDate, a.ShippedDate, a.ShipName, 
       b.FirstName, b.LastName, b.Title, b.Address, b.City, b.Region
FROM dbo.Orders AS a
LEFT JOIN dbo.employees AS b
ON a.EmployeeID = b.EmployeeID
WHERE a.OrderDate BETWEEN '1997-04-01 00:00:00.000' AND '1997-12-31 00:00:00.000';

SELECT a.FirstName, a.LastName, b.EmployeeID, a.Address, b.OrderID, b.CustomerID, b.OrderDate
FROM dbo.Employees a
LEFT JOIN dbo.Orders b
ON a.EmployeeID = b.EmployeeID
WHERE b.OrderDate BETWEEN '1997-04-01 00:00:00.000' AND '1997-12-31 00:00:00.000';

--Right JOIN
SELECT a.FirstName, a.LastName, b.EmployeeID, a.Address, b.OrderID, b.CustomerID, b.OrderDate
FROM dbo.Employees a
RIGHT JOIN dbo.Orders b
ON a.EmployeeID = b.EmployeeID
WHERE b.OrderDate BETWEEN '1997-04-01 00:00:00.000' AND '1997-12-31 00:00:00.000';


SELECT a.CustomerID, a.OrderID, a.OrderDate, b.CompanyName, b.Address
FROM dbo.Orders AS a
LEFT JOIN dbo.Customers AS b
ON a.CustomerID = b.CustomerID;


---Cartesian (CROSS) Join
SELECT a.FirstName, a.LastName, b.EmployeeID, b.OrderID
FROM dbo.Employees a
CROSS JOIN dbo.Orders b;


--Self Join
SELECT *
FROM dbo.Products;
--Retrieve products with thesame supplier

SELECT a.ProductID AS productID1, a.ProductName AS ProductName1, 
       b.ProductID AS ProductID2, b.ProductName AS ProductName2,
	   c.CompanyName 
FROM dbo.Products AS a
JOIN dbo.Products AS b
ON a.SupplierID = b.SupplierID AND a.ProductID != b.ProductID
JOIN dbo.Suppliers C
ON a.SupplierID = c.SupplierID;

--Retrieve the products from thesame category
SELECT * FROM dbo.Categories;
SELECT * FROM dbo.Products;

SELECT a.ProductID AS ProductID1, a.ProductName AS ProductName1, b.ProductID AS ProductID2, b.ProductName AS ProductName2,c.CategoryName
FROM dbo.Products a
INNER JOIN dbo.Products b
ON a.CategoryID = b.CategoryID AND a.ProductID != b.ProductID
INNER JOIN dbo.Categories c
ON a.CategoryID = c.CategoryID;

-- <> means not equal to

--Anti Join 
SELECT * FROM dbo.Customers;
SELECT * FROM dbo.Orders;

--An Anti join is a type of join that returns rows from one table where no corresponding rows exist in another table.
--SQL does not have a direct Anti join keyword, but it can be implemented by using a LEFT JOIN combined with a WHERE clause
-- to check for null values. 

--Retrieve the details of all customers that have not made any order
SELECT a.CustomerID, a.CompanyName, a.Address, a.City, b.OrderID, b.OrderDate
FROM dbo.Customers AS a
LEFT JOIN dbo.Orders b
ON a.CustomerID = b.CustomerID
WHERE b.OrderID IS NULL;


--Retrieve the SupplierID and names of suppliers that did not supply any products
SELECT a.SupplierID, a.CompanyName, b.ProductID
FROM dbo.Suppliers a
LEFT JOIN dbo.Products b
ON a.supplierID = b.SupplierID
WHERE b.ProductID IS NULL;

--FULL Outer Join
--Full Outer Join is used to retrieve all rows from both tables whether they are matching or not.
--Retrieve all orders and their corresponding Order details including the customers that made those orders

SELECT * FROM dbo.Orders
SELECT * FROM dbo.[Order Details];

SELECT a.OrderID, a.CustomerID, a.OrderDate, a.ShippedDate, b.ProductID, b.UnitPrice, b.Quantity,c.CompanyName
FROM dbo.Orders a
FULL OUTER JOIN dbo.[Order Details] b
ON a.OrderID = b.OrderID
LEFT JOIN dbo.Customers c
ON a.CustomerID = c.CustomerID;


SELECT a.OrderID, a.CustomerID, a.OrderDate, a.ShippedDate, b.ProductID, b.UnitPrice, b.Quantity
FROM dbo.Orders a
CROSS JOIN dbo.[Order Details] b


CREATE database Lagosteachers;

USE Lagosteachers;

CREATE TABLE Employees (
     EmployeeID INT,
	 FirstName VARCHAR(50),
	 LastName VARCHAR(50)
);

INSERT INTO Employees( EmployeeID, FirstName, LastName)
VALUES (1, 'Temi', 'Fola'),
	   (2, 'Sola', 'Chisom'),
	   (3, 'Gabor','Chidi'),
	   (4, 'Kunle', 'Joe')


SELECT *
FROM dbo.Employees;

ALTER TABLE Employees
ADD Address Varchar(50);

UPDATE Employees
SET Address = 'Ikeja, Lagos'
WHERE EmployeeID = 1;

UPDATE Employees
SET Address = 'Ojota, Lagos'
WHERE EmployeeID = 2;

UPDATE Employees
SET Address = 'Iwo Road, Ibadan'
WHERE EmployeeID = 3;

UPDATE Employees
SET Address = 'Sango, Ibadan'
WHERE EmployeeID = 4;


--Difference between DELETE, TRUNCATE  and DROP function
---The DELETE function is used to delete a specific row in a table
--TRUNCATE function is used to remove ALL rows from a table but keeps the table structure.
--DROP Function is used to remove the table entirely from the database. 

DELETE FROM dbo.Employees WHERE EmployeeID =1;

TRUNCATE TABLE dbo.Employees;

SELECT * FROM dbo.Employees;

DROP TABLE dbo.Employees;

DROP DATABASE Lagosteachers;

UPDATE Employees
SET Address = NULL
WHERE EmployeeID = 1

ALTER TABLE Employees
DROP COLUMN Address;
