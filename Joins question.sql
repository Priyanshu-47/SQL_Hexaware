-- Joins Question
-- List of all order along with customer info
SELECT Orders.OrderID,Orders.CustomerID,Customers.FirstName,Customers.Lastname
FROM Orders
JOIN Customers ON Orders.OrderID = Customers.CustomerID

--total revenue by each electronic gadget with product name 
Select Products.ProductName,
SUM(OrderDetails.Quantity*Products.Price) AS total_revenue
FROM Products 
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
WHERE Products.Category = 'Electronic' GROUP BY Products.ProductName;

SELECT Products.ProductName, Products.Category, SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = 'Electronic'
GROUP BY Products.ProductName, Products.Category;

-- list all customers who have one purchase with names and contact
SELECT Customers.CustomerID,Customers.FirstName,Customers.LastName,Customers.Phone
From Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerId,Customers.FirstName,Customers.LastName,Customers.Phone;

-- most ordered gadget and include product naame and total quantity ordered
SELECT Products.Category,Products.ProductName,
SUM(OrderDetails.Quantity) AS total_quantity_ordered
FROM Products 
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID 
WHERE Products.Category = 'Electronic' GROUP BY Products.Category,Products.ProductName
ORDER BY total_quantity_ordered DESC;  

-- list out electronic gadget with categories 
SELECT Products.ProductName,Products.Category
FROM Products

-- Calculate average order value for each customer with thier name
SELECT Customers.CustomerID,Customers.FirstName,Customers.LastName,
AVG(Orders.TotalAmount) AS average_order_value
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID,Customers.FirstName,Customers.LastName;

-- Order with highest total revenue include orderid customer info and total revenue
SELECT Orders.OrderID,Customers.CustomerID,Customers.FirstName,Customers.LastName,
SUM(Orders.TotalAmount) AS total_revenue
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
GROUP BY Orders.OrderID,Customers.CustomerID,Customers.FirstName,Customers.LastName
ORDER BY total_revenue DESC;

-- List electronic gadget no. of times each product ordered
SELECT Products.ProductID,Products.ProductName,Products.Category,
COUNT(OrderDetails.OrderId) AS order_count
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
WHERE Products.Category = 'Electronic'
GROUP BY Products.ProductID,Products.ProductName,Products.Category;

--Customers who have purchased a specific electronic gadget
DECLARE @ProductName VARCHAR(20);
SET @ProductName = 'smartphone';
SELECT Customers.CustomerID,Customers.FirstName,Customers.LastName
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.OrderID
JOIN Products ON Orders.OrderID = Products.ProductID
WHERE Products.ProductName = @ProductName;

-- Total revenue generated within a specific time period
DECLARE @StartDate DATE;
DECLARE @EndDate DATE;
SET @StartDate = '2023-01-01'; 
SET @EndDate = '2023-12-31';  
SELECT SUM(TotalAmount) AS total_revenue
FROM Orders
WHERE OrderDate BETWEEN @StartDate AND @EndDate;

