-- 1.1 Create the database named "HMBank"
CREATE DATABASE HMBank;
USE HMBank;

-- 1.6 Write SQL scripts to create the mentioned tables with appropriate data types, constraints, and relationships. 
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    DOB DATE,
    email VARCHAR(255),
    phone_number VARCHAR(20),
    address VARCHAR(255)
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(50),
    balance DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(50),
    amount DECIMAL(10, 2),
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id) 
);

-- 2.1 Insert at least 10 sample records into each of the following tables. 
INSERT INTO Customers (customer_id, first_name, last_name, DOB, email, phone_number, address)
VALUES
    (1, 'Rajesh', 'Kumar', '1985-05-15', 'rajesh.kumar@example.com', '9876543210', '123, Main Street, City'),
    (2, 'Priya', 'Verma', '1990-08-22', 'priya.verma@example.com', '8765432109', '456, Market Street, Town'),
    (3, 'Amit', 'Singh', '1988-03-10', 'amit.singh@example.com', '7654321098', '789, Mall Road, Village'),
    (4, 'Neha', 'Sharma', '1992-12-05', 'neha.sharma@example.com', '6543210987', '101, Avenue Street, District'),
    (5, 'Anand', 'Patel', '1987-07-18', 'anand.patel@example.com', '5432109876', '202, Boulevard, State'),
    (6, 'Smita', 'Mehta', '1995-06-30', 'smita.mehta@example.com', '4321098765', '303, Crescent Road, Region'),
    (7, 'Vikram', 'Gupta', '1983-09-25', 'vikram.gupta@example.com', '3210987654', '404, Park Lane, Province'),
    (8, 'Shreya', 'Chopra', '1998-04-12', 'shreya.chopra@example.com', '2109876543', '505, Garden Street, Division'),
    (9, 'Ravi', 'Malhotra', '1980-11-08', 'ravi.malhotra@example.com', '1098765432', '606, Grove Avenue, Territory'),
    (10, 'Pooja', 'Saxena', '1993-02-14', 'pooja.saxena@example.com', '9876543210', '707, Plaza Road, Zone');;

INSERT INTO Accounts (account_id, customer_id, account_type, balance)
VALUES
    (1, 1, 'Savings', 50000.00),
    (2, 2, 'Current', 30000.00),
    (3, 3, 'Fixed Deposit', 80000.00),
    (4, 4, 'Savings', 60000.00),
    (5, 5, 'Current', 35000.00),
    (6, 6, 'Fixed Deposit', 70000.00),
    (7, 7, 'Savings', 45000.00),
    (8, 8, 'Current', 40000.00),
    (9, 9, 'Fixed Deposit', 90000.00),
    (10, 10, 'Savings', 55000.00);


INSERT INTO Transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
VALUES
    (1, 1, 'Deposit', 5000.00, '2023-01-15'),
    (2, 2, 'Withdrawal', 3000.00, '2023-02-20'),
    (3, 3, 'Transfer', 2000.00, '2023-03-10'),
    (4, 4, 'Deposit', 8000.00, '2023-04-05'),
    (5, 5, 'Withdrawal', 1500.00, '2023-05-12'),
    (6, 6, 'Transfer', 3000.00, '2023-06-18'),
    (7, 7, 'Deposit', 6000.00, '2023-07-25'),
    (8, 8, 'Withdrawal', 2000.00, '2023-08-30'),
    (9, 9, 'Transfer', 2500.00, '2023-09-08'),
    (10, 10, 'Deposit', 7000.00, '2023-10-15');


-- 2.1 Write a SQL query to retrieve the name, account type and email of all customers. 
SELECT c.first_name,c.last_name,a.account_type,c.email
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

-- 2.2 Write a SQL query to list all transaction corresponding customer.
SELECT c.customer_id,c.first_name,c.last_name,t.transaction_id,t.transaction_type,t.amount
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id;

-- 2.3 Write a SQL query to increase the balance of a specific account by a certain amount.
UPDATE Accounts
SET balance = balance + 500
WHERE account_id = '2';

SELECT * FROM Accounts;

-- 2.4  Write a SQL query to Combine first and last names of customers as a full_name
SELECT Customers.first_name+' '+customers.last_name AS full_name
FROM Customers

-- 2.5 Write a SQL query to remove accounts with a balance of zero where the account type is savings.
DELETE FROM Accounts 
WHERE balance = 0 AND account_type = 'savings';

-- 2.6 Write a SQL query to Find customers living in a specific city
SELECT c.first_name,c.last_name,c.address
FROM Customers c
WHERE c.address = '404, Park Lane, Province';

-- 2.7 Write a SQL query to Get the account balance for a specific account.
SELECT a.account_type,a.balance
FROM Accounts a
WHERE account_type = 'Current';

-- 2.8	Write a SQL query to List all current accounts with a balance greater than $1,000.
SELECT a.account_type,a.balance
FROM Accounts a
WHERE account_type = 'current' AND balance > 1000;

-- 2.9 Write a SQL query to Retrieve all transactions for a specific account
SELECT a.account_id,a.account_type,t.transaction_type,t.amount
FROM Accounts a
JOIN Transactions t ON a.account_id = t.account_id
WHERE account_type = 'savings';

-- 2.10 Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate
DECLARE @interest_rate DECIMAL(5, 4);
SET @interest_rate = 0.06
SELECT account_id,account_type,balance,balance * @interest_rate AS interest_accrued
FROM Accounts
WHERE account_type = 'Savings';


-- 2.11 . Write a SQL query to Identify accounts where the balance is less than a overdraft limit.
DECLARE @overdraft_limit DECIMAL(10, 2);
SET @overdraft_limit = 35000.00
SELECT account_id,account_type,balance
FROM Accounts
WHERE balance < @overdraft_limit;

-- 2.12 Write a SQL query to Find customers not living in a specific city.
SELECT c.first_name,c.last_name,c.address
FROM Customers c
WHERE address NOT IN ('404, Park Lane, Province');




-- 3.1 Write a SQL query to Find the average account balance for all customers.
SELECT AVG(balance) AS average_balance
FROM Accounts;

-- 3.2  . Write a SQL query to Retrieve the top 10 highest account balances.
SELECT account_id,customer_id,account_type,balance
FROM Accounts 
ORDER BY balance DESC ;

-- 3.3 Write a SQL query to Calculate Total Deposits for All Customers in specific date.
SELECT	c.customer_id,c.first_name,c.last_name,SUM(t.amount) AS total_deposits
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
WHERE t.transaction_type = 'Deposit' AND t.transaction_date = '2023-04-05'
GROUP BY c.customer_id,c.first_name,c.last_name;

-- 3.4 Write a SQL query to Find the Oldest and Newest Customers.
--oldest
SELECT TOP 1 customer_id,first_name,last_name,DOB AS date_of_birth
FROM Customers
ORDER BY date_of_birth ASC;
--newest
SELECT TOP 1 customer_id,first_name,last_name,DOB AS date_of_birth
FROM Customers
ORDER BY date_of_birth DESC;

-- 3.5 Write a SQL query to Retrieve transaction details along with the account type.
SELECT t.transaction_id,t.transaction_type,t.amount,t.transaction_date,a.account_type
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
GROUP BY t.transaction_id,t.transaction_type,t.amount,t.transaction_date,a.account_type;

-- 3.6 . Write a SQL query to Get a list of customers along with their account details
SELECT c.customer_id,c.first_name,c.last_name,a.account_type,a.account_id
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id,a.account_id,c.first_name,c.last_name,a.account_type;

-- 3.7 Write a SQL query to Retrieve transaction details along with customer information for a specific 
DECLARE @specific_account_id INT;
SET @specific_account_id = 4; 
SELECT t.transaction_id,t.transaction_type,t.amount,t.transaction_date,c.customer_id,
    c.first_name,c.last_name,c.DOB,c.email,c.phone_number,c.address
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
JOIN Customers c ON a.customer_id = c.customer_id
WHERE t.account_id = @specific_account_id;

-- 3.8 Write a SQL query to Identify customers who have more than one account.

-- 3.9 Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals
SELECT account_id,SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE 0 END) - SUM(CASE WHEN transaction_type = 'Withdrawal' THEN amount ELSE 0 END) AS amount_difference
FROM Transactions
GROUP BY account_id;

-- 3.10 Write a SQL query to Calculate the average daily balance for each account over a specified period.
SELECT a.account_id,
    AVG(daily_balance) AS average_daily_balance
FROM accounts a
JOIN (
    SELECT account_id,transaction_date,
			SUM(amount) OVER (PARTITION BY account_id ORDER BY transaction_date) AS daily_balance
    FROM transactions) t ON a.account_id = t.account_id
WHERE t.transaction_date BETWEEN '2023-02-20' AND '2023-07-09'  
GROUP BY a.account_id;

-- 3.11 Calculate the total balance for each account type.
SELECT a.account_type,SUM(t.amount) AS total_balance
FROM Accounts a
JOIN Transactions t ON a.account_id = t.account_id
GROUP BY a.account_type;

-- 3.12 . Identify accounts with the highest number of transactions order by descending order.
SELECT account_id,COUNT(*) AS transaction_count
FROM Transactions
GROUP BY account_id
ORDER BY transaction_count DESC;

-- 3.13  List customers with high aggregate account balances, along with their account types.
SELECT
    c.customer_id,c.first_name,c.last_name,a.account_type,
    SUM(t.amount) AS aggregate_balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id, c.first_name,c.last_name, a.account_type
ORDER BY aggregate_balance DESC;

-- 3.14. Identify and list duplicate transactions based on transaction amount, date, and account.

-- 4.1 Retrieve the customer(s) with the highest account balance.
SELECT TOP 1 c.customer_id,c.first_name,c.last_name,a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
ORDER BY a.balance DESC;

-- 4.2 Calculate the average account balance for customers who have more than one account.
SELECT AVG(balance) AS average_balance
FROM
    (SELECT c.customer_id,a.balance,
            COUNT(a.account_id) OVER (PARTITION BY c.customer_id) AS account_count
        FROM customers c
        JOIN accounts a ON c.customer_id = a.customer_id
    ) AS subquery
WHERE subquery.account_count > 1;

-- 4.3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.
WITH AvgTransaction AS (
    SELECT AVG(amount) AS avg_amount
    FROM transactions
)
SELECT a.account_id,t.transaction_id,t.amount,t.transaction_type,t.transaction_date
FROM accounts a
JOIN transactions t ON a.account_id = t.account_id
CROSS JOIN AvgTransaction
WHERE t.amount > AvgTransaction.avg_amount;

-- 4.4 Identify customers who have no recorded transactions.
SELECT c.customer_id,c.first_name,c.last_name
FROM customers c
LEFT JOIN Accounts a ON c.customer_id = a.customer_id
LEFT JOIN transactions t ON a.account_id = t.account_id
WHERE t.account_id IS NULL;

-- 4.5 Calculate the total balance of accounts with no recorded transactions.
SELECT SUM(a.balance) AS total_balance_no_transactions
FROM Accounts a
LEFT JOIN Transactions t ON a.account_id = t.account_id
WHERE t.transaction_id IS NULL;

-- 4.6 Retrieve transactions for accounts with the lowest balance.
SELECT t.transaction_id,t.account_id,t.transaction_type,t.amount
FROM Transactions t
JOIN
    (SELECT a.account_id,MIN(a.balance) AS min_balance
     FROM Accounts a
     GROUP BY a.account_id
    ) AS minBalanceSubquery ON t.account_id = minBalanceSubquery.account_id
JOIN Accounts a ON t.account_id = a.account_id AND a.balance = minBalanceSubquery.min_balance;

-- 4.7 Identify customers who have accounts of multiple types.
SELECT c.customer_id,c.first_name,c.last_name,
    COUNT(DISTINCT a.account_type) AS num_account_types
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(DISTINCT a.account_type) > 1;

-- 4.8 Calculate the percentage of each account type out of the total number of accounts.
SELECT account_type,
    COUNT(*) AS account_count,
    CAST(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS DECIMAL(5, 2)) AS percentage
FROM Accounts
GROUP BY account_type;

-- 4.9 Retrieve all transactions for a customer with a given customer_id.
SELECT t.transaction_id,t.account_id,t.transaction_type,t.amount
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id
WHERE a.customer_id = 4;

-- 4.10 Calculate the total balance for each account type, including a subquery within the SELECT clause.
SELECT account_type,
    ( SELECT SUM(balance)
      FROM Accounts a2
      WHERE a2.account_type = a1.account_type
    ) AS total_balance
FROM Accounts a1
GROUP BY account_type;

------------------------------------------------------------








