-- Problem 1 & 2
-- 1. Using JOINs in a single query, combine data from all three tables (employees, products, sales) to view all sales with complete employee and product information in one table.
SELECT SalesID, SalesPersonID, CustomerID, Quantity, FirstName, MiddleInitial, LastName, Name, Price, products.ProductID FROM sales 
JOIN employees ON sales.SalesPersonID = employees.EmployeeID
JOIN products ON sales.ProductID = products.ProductID; 

-- 2a. Create a View for the query you made in Problem 1 named "all_sales"
-- CREATE VIEW all_sales AS SELECT SalesID, SalesPersonID, CustomerID, Quantity, FirstName, MiddleInitial, LastName, 
-- Name, Price, products.ProductID FROM sales 
-- JOIN employees ON sales.SalesPersonID = employees.EmployeeID
-- JOIN products ON sales.ProductID = products.ProductID;

-- NOTE: You'll want to remove any duplicate columns to clean up your view!


-- 2b. Test your View by selecting all rows and columns from the View

SELECT * FROM all_sales;

-- Problem 3
-- Find the average sale amount for each sales person

SELECT SalesPersonID, AVG(quantity) AS average_sales FROM all_sales GROUP BY SalesPersonID;
 
-- Problem 4
-- Find the top three sales persons by total sales

SELECT SalesPersonID, SUM(quantity) AS total_sales FROM all_sales GROUP BY SalesPersonID ORDER BY SUM(quantity) DESC LIMIT 3;

-- Problem 5
-- Find the product that has the highest price

SELECT name, MAX(price) AS highest_price FROM all_sales GROUP BY name ORDER BY MAX(price) DESC LIMIT 1;

-- Problem 6
-- Find the product that was sold the most times

SELECT name, MAX(quantity) AS sold_the_most_times FROM all_sales GROUP BY name ORDER BY MAX(quantity) DESC LIMIT 1;

-- Problem 7
-- Using a subquery, find all products that have a price higher than the average price for all products

SELECT name FROM all_sales WHERE price > (SELECT AVG(price) FROM all_sales);
 
-- Problem 8
-- Find the customer who spent the most money in purchased products

SELECT CustomerID, price*quantity AS money_spent FROM all_sales GROUP BY CustomerID Order By price*quantity DESC LIMIT 1;

-- Problem 9
-- Find the total number of sales for each sales person

SELECT SalesPersonID, price*quantity AS number_of_sales FROM all_sales GROUP BY SalesPersonID ORDER BY price*quantity;

-- Problem 10
-- Find the sales person who sold the most to the customer you found in Problem 8

SELECT SalesPersonID, CustomerID, price*quantity AS sales 
FROM all_sales GROUP BY CustomerID Order By price*quantity DESC LIMIT 1;