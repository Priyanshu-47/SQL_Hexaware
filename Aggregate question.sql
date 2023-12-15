-- Aggregate question
-- query to determine which cutomer not placed order
SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;

-- total number of products available for sale
SELECT COUNT(*) AS TotalProducts
FROM Products;


-- total revenue by techshop
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;

-- Average quantity ordered in speific category
DECLARE @CategoryName NVARCHAR(50);
SET @CategoryName = 'Electronic';

SELECT AVG(Quantity) AS AverageQuantity
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = @CategoryName;

Select * from Products;


--total revenue by a specific customer
DECLARE @CustomerID INT;  
SET @CustomerID = 2;

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE CustomerID = @CustomerID;

-- Find the customer who have placed most orders

SELECT TOP 1 WITH TIES Customers.CustomerID, Customers.FirstName, Customers.LastName, COUNT(*) AS OrderCount
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
ORDER BY OrderCount DESC;

-- Most popular category and most ordered

SELECT TOP 1 WITH TIES Products.Category, SUM(Quantity) AS TotalQuantityOrdered
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.Category
ORDER BY TotalQuantityOrdered DESC;

-- Customer who have spent the most money
SELECT TOP 1 WITH TIES Customers.CustomerID, Customers.FirstName, Customers.LastName, SUM(TotalAmount) AS TotalSpending
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = 'Electronic'
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
ORDER BY TotalSpending DESC;

-- average order value by customers
SELECT AVG(TotalAmount) AS AverageOrderValue
FROM Orders;

-- Total no of orders placed by each customer
SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName;

