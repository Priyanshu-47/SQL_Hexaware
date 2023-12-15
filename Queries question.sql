-- Inserting the records to the tables created
-- in Customers table

INSERT INTO Customers(CustomerID,FirstName,LastName,Email,Phone,Address)
VALUES
	(1, 'Amit', 'Kumar', 'amit.kumar@example.com', '9876543210', '123 Main Street, City'),
    (2, 'Priya', 'Verma', 'priya.verma@example.com', '8765432109', '456 Market Street, City'),
    (3, 'Rahul', 'Sharma', 'rahul.sharma@example.com', '7654321098', '789 Park Avenue, City'),
    (4, 'Neha', 'Singh', 'neha.singh@example.com', '6543210987', '101 Broad Street, City'),
    (5, 'Vikas', 'Yadav', 'vikas.yadav@example.com', '5432109876', '202 High Street, City'),
    (6, 'Ananya', 'Gupta', 'ananya.gupta@example.com', '4321098765', '303 Oak Street, City'),
    (7, 'Rajat', 'Patel', 'rajat.patel@example.com', '3210987654', '404 Pine Street, City'),
    (8, 'Sneha', 'Rao', 'sneha.rao@example.com', '2109876543', '505 Elm Street, City'),
    (9, 'Pranav', 'Iyer', 'pranav.iyer@example.com', '1098765432', '606 Cedar Street, City'),
    (10, 'Pooja', 'Menon', 'pooja.menon@example.com', '9876543210', '707 Maple Street, City');


-- In Prducts table
INSERT INTO Products(ProductID,ProductName,Description,Price)
VALUES
	(1, 'Laptop', 'laptop with high-speed processor', 1200.00),
    (2, 'Smartphone', 'smartphone with advanced features', 800.50),
    (3, 'Wireless Mouse', 'Ergonomic design with connectivity', 29.99),
    (4, 'Bluetooth Headphones', 'Noise-canceling headphones', 99.95),
    (5, 'Gaming Keyboard', 'Mechanical keyboard for gaming', 129.99),
    (6, 'External Hard Drive', 'capacity storage for data backup', 149.00),
    (7, '4K Monitor', 'Ultra HD monitor for clear visuals', 499.99),
    (8, 'Webcam', 'HD webcam for video conferencing', 69.50),
    (9, 'Portable Charger', 'charger for on-the-go charging', 39.95),
    (10, 'Wireless Router', 'router for a seamless connection', 79.99);


-- insert in orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 1, '2023-01-01', 39.98),
    (2, 2, '2023-02-01', 59.98),
    (3, 3, '2023-03-01', 79.97),
    (4, 4, '2023-04-01', 99.96),
    (5, 5, '2023-05-01', 119.95),
    (6, 6, '2023-06-01', 139.94),
    (7, 7, '2023-07-01', 159.93),
    (8, 8, '2023-08-01', 179.92),
    (9, 9, '2023-09-01', 199.91),
    (10, 10, '2023-10-01', 219.90);

-- insert in orderdetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
    (1, 1, 1, 2),
    (2, 1, 2, 1),
    (3, 2, 3, 3),
    (4, 2, 4, 1),
    (5, 3, 5, 2),
    (6, 3, 6, 1),
    (7, 4, 7, 3),
    (8, 4, 8, 1),
    (9, 5, 9, 2),
    (10, 5, 10, 1);

-- insert into inventory
INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES
    (1, 1, 100, '2023-01-01 12:00:00'),
    (2, 2, 50, '2023-02-01 10:30:00'),
    (3, 3, 75, '2023-03-01 15:45:00'),
    (4, 4, 30, '2023-04-01 08:20:00'),
    (5, 5, 60, '2023-05-01 14:10:00'),
    (6, 6, 25, '2023-06-01 11:55:00'),
    (7, 7, 40, '2023-07-01 09:30:00'),
    (8, 8, 90, '2023-08-01 13:25:00'),
    (9, 9, 55, '2023-09-01 16:05:00'),
    (10, 10, 20, '2023-10-01 07:40:00');


-- Retrive names and mails of Customers
SELECT FirstName,LastName,Email
FROM Customers;

--Retrieve orders with date and customer name
SELECT Orders.OrderID,Orders.OrderDate,Customers.FirstName,Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- Insert new record in customers table
INSERT INTO Customers(CustomerID,FirstName,LastName,Email,Phone,Address)
VALUES(11,'NewFname','NewLname','New@gmail.com','1234565690','New Address');

-- update the prices in products table with increament of 10%
ALTER TABLE Products
ADD Category VARCHAR(50);

UPDATE Products
SET Category = CAST(Description AS VARCHAR(50));

ALTER TABLE Products
DROP COLUMN Description;


UPDATE Products
SET Price = Price * 1.10
WHERE Category = 'Effective fitness equipment';

-- delete a order and its detals from orders and order deatil table
DECLARE @OrderIDToDelete INT = 1

DELETE FROM OrderDetails WHERE OrderID = @OrderIDToDelete;
DELETE FROM Orders WHERE OrderID = @OrderIDToDelete;

-- Insert a new order into the "Orders" table.
-- Include the customer ID, order ID, order date, and any other necessary information.
DECLARE @CustomerID INT = 1;  -- Replace with the actual customer ID
DECLARE @OrderID INT = 11;  -- Replace with the actual unique order ID
DECLARE @OrderDate DATE = '2023-11-28';  -- Replace with the actual order date

-- Generate a unique value for OrderID using a sequence, identity, or any other method
-- For example, you might use a variable or a SELECT statement to get the next available OrderID.

-- Example using a variable (replace with your actual logic)
SET @OrderID = (SELECT MAX(OrderID) + 1 FROM Orders);

DECLARE @CustomerIDToUpdate INT = 4;

UPDATE Customers
SET Email = 'new.email@example.com', Address = 'New Address'
WHERE CustomerID = @CustomerIDToUpdate;

-- Example using a SELECT statement with a sequence (replace with your actual sequence)
-- SET @OrderID = NEXT VALUE FOR YourSequence;

-- Insert the order
INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES (@OrderID, @CustomerID, @OrderDate);


--Recalculate and update the total cost
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(Quantity * Products.Price)
    FROM OrderDetails
    JOIN Products ON OrderDetails.ProductID = Products.ProductID
    WHERE OrderDetails.OrderID = Orders.OrderID
);

-- Delete all order and its detal for a specific customer
DECLARE @CustomerIDToDelete INT = 5;

DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerIDToDelete);
DELETE FROM Orders WHERE CustomerID = @CustomerIDToDelete;

-- query to insert new record in product table
INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES (11, 'NewGadget', 'Cutting-edge gadget', 59.99);

-- query to insert order status
-- Add a new column 'Status' to the "Orders" table with a default value of 'Pending'.
ALTER TABLE Orders
ADD Status NVARCHAR(50) DEFAULT 'Pending';

UPDATE Orders
SET Status = 'Pending'
WHERE Status IS NULL;


-- Update the status of a specific order in the "Orders" table.
-- Allow users to input the order ID and the new status.
DECLARE @OrderIDToUpdate INT = 2;  
DECLARE @NewStatus NVARCHAR(50) = 'Shipped'

UPDATE Orders
SET Status = @NewStatus
WHERE OrderID = @OrderIDToUpdate;

select * from Orders;


-- Add a new column 'NumOrders' to the "Customers" table.
ALTER TABLE Customers
ADD NumOrders INT;

-- count the total orders by each customers in the "Customers" table.
UPDATE Customers
SET NumOrders = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);


