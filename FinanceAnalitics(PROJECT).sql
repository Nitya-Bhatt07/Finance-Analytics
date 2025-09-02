DROP DATABASE FinanceAnalytics;

CREATE DATABASE FinanceAnalytics;

USE FinanceAnalytics;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    SignupDate DATE,
    City VARCHAR(50),
    IsActive BOOLEAN
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    Balance DECIMAL(10,2),
    AccountType VARCHAR(20),
    CreatedOn DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATE,
    TransactionType VARCHAR(20),  -- 'Credit' or 'Debit'
    Amount DECIMAL(10,2),
    Merchant VARCHAR(100),
    IsFraud BOOLEAN,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

-- Customers:
INSERT INTO Customers VALUES
(1, 'Alice', 'alice@email.com', '2022-01-01', 'New York', 1),
(2, 'Bob', 'bob@email.com', '2022-05-15', 'Chicago', 1),
(3, 'Charlie', 'charlie@email.com', '2022-07-20', 'San Francisco', 0),
(4, 'David', 'david@email.com', '2022-09-10', 'Boston', 1),
(5, 'Emma', 'emma@email.com', '2022-10-01', 'Los Angeles', 1),
(6, 'Frank', 'frank@email.com', '2022-11-15', 'Houston', 0),
(7, 'Grace', 'grace@email.com', '2023-01-05', 'Miami', 1),
(8, 'Henry', 'henry@email.com', '2023-02-20', 'Seattle', 1),
(9, 'Ivy', 'ivy@email.com', '2023-03-10', 'Dallas', 0),
(10, 'Jack', 'jack@email.com', '2023-04-01', 'Denver', 1),
(11, 'Kara', 'kara@email.com', '2023-04-18', 'Phoenix', 1),
(12, 'Leo', 'leo@email.com', '2023-05-02', 'Austin', 0),
(13, 'Mia', 'mia@email.com', '2023-05-25', 'Atlanta', 1),
(14, 'Noah', 'noah@email.com', '2023-06-11', 'Portland', 1),
(15, 'Olivia', 'olivia@email.com', '2023-06-30', 'San Diego', 1),
(16, 'Paul', 'paul@email.com', '2023-07-12', 'Chicago', 1),
(17, 'Quinn', 'quinn@email.com', '2023-08-03', 'New York', 0),
(18, 'Ryan', 'ryan@email.com', '2023-08-19', 'San Francisco', 1),
(19, 'Sophia', 'sophia@email.com', '2023-09-05', 'Boston', 1),
(20, 'Tom', 'tom@email.com', '2023-09-18', 'Houston', 1),
(21, 'Uma', 'uma@email.com', '2023-10-02', 'Miami', 0),
(22, 'Victor', 'victor@email.com', '2023-10-25', 'Los Angeles', 1),
(23, 'Wendy', 'wendy@email.com', '2023-11-11', 'Seattle', 1);

-- Accounts:
INSERT INTO Accounts VALUES
(101, 1, 1500.00, 'Personal', '2022-01-02'),
(102, 2, 2200.00, 'Business', '2022-05-20'),
(103, 3, 500.00, 'Personal', '2022-07-21'),
(104, 4, 3200.50, 'Personal', '2022-09-12'),
(105, 5, 7800.00, 'Business', '2022-10-02'),
(106, 6, 1200.00, 'Personal', '2022-11-16'),
(107, 7, 22000.00, 'Business', '2023-01-06'),
(108, 8, 950.75, 'Personal', '2023-02-21'),
(109, 9, 500.00, 'Personal', '2023-03-11'),
(110, 10, 15000.00, 'Business', '2023-04-02'),
(111, 11, 3300.00, 'Personal', '2023-04-19'),
(112, 12, 670.00, 'Personal', '2023-05-03'),
(113, 13, 12450.00, 'Business', '2023-05-26'),
(114, 14, 8500.00, 'Personal', '2023-06-12'),
(115, 15, 3000.00, 'Business', '2023-07-01'),
(116, 16, 999.99, 'Personal', '2023-07-13'),
(117, 17, 500.00, 'Personal', '2023-08-04'),
(118, 18, 7400.00, 'Business', '2023-08-20'),
(119, 19, 20000.00, 'Business', '2023-09-06'),
(120, 20, 330.00, 'Personal', '2023-09-19'),
(121, 21, 12000.00, 'Business', '2023-10-03'),
(122, 22, 4999.00, 'Personal', '2023-10-26'),
(123, 23, 540.00, 'Personal', '2023-11-12');


-- Transactions:
INSERT INTO Transactions VALUES
(1001, 101, '2022-01-05', 'Credit', 2000.00, 'Bank Transfer', 0),
(1002, 101, '2022-01-06', 'Debit', 500.00, 'Amazon', 0),
(1003, 102, '2022-05-25', 'Debit', 1000.00, 'Uber', 0),
(1004, 103, '2022-08-01', 'Debit', 450.00, 'AliExpress', 1),
(1005, 104, '2022-09-15', 'Credit', 1500.00, 'PayPal', 0),
(1006, 105, '2022-10-05', 'Debit', 500.00, 'Netflix', 0),
(1007, 106, '2022-11-20', 'Credit', 2200.00, 'Stripe', 0),
(1008, 107, '2023-01-10', 'Debit', 1200.00, 'Uber', 0),
(1009, 108, '2023-02-25', 'Debit', 450.00, 'Starbucks', 0),
(1010, 109, '2023-03-12', 'Credit', 900.00, 'Zelle', 1),
(1011, 110, '2023-04-05', 'Debit', 2000.00, 'BestBuy', 0),
(1012, 111, '2023-04-21', 'Debit', 120.00, 'Spotify', 0),
(1013, 112, '2023-05-05', 'Credit', 3000.00, 'Bank Transfer', 0),
(1014, 113, '2023-05-30', 'Debit', 7000.00, 'Apple Store', 0),
(1015, 114, '2023-06-15', 'Credit', 2500.00, 'PayPal', 0),
(1016, 115, '2023-07-05', 'Debit', 800.00, 'Swiggy', 0),
(1017, 116, '2023-07-20', 'Credit', 1200.00, 'PhonePe', 0),
(1018, 117, '2023-08-07', 'Debit', 300.00, 'Flipkart', 0),
(1019, 118, '2023-08-22', 'Debit', 1100.00, 'Myntra', 0),
(1020, 119, '2023-09-08', 'Credit', 5000.00, 'Google Pay', 0),
(1021, 120, '2023-09-20', 'Debit', 200.00, 'Zomato', 0),
(1022, 121, '2023-10-04', 'Debit', 1500.00, 'BigBasket', 1),
(1023, 122, '2023-10-28', 'Credit', 4000.00, 'Bank Transfer', 0);




select * from customers;
select * from accounts;
select * from transactions;

-- Total Number of Active Customers (count means aggregation applied):
SELECT COUNT(*) AS ActiveCustomers
FROM Customers
WHERE IsActive = 1;

-- Total Transactions and Amount per Month:
SELECT
    DATE_FORMAT(TransactionDate, '%Y-%m') AS Month,
    COUNT(*) AS TotalTransactions,
    SUM(Amount) AS TotalAmount
FROM Transactions
GROUP BY Month -- to see monthly revenue
order by Month desc;

 -- Customer-wise Total Debit & Credit:
SELECT
    c.Name,
    SUM(CASE WHEN t.TransactionType = 'Credit' THEN t.Amount ELSE 0 END) AS TotalCredit,
    SUM(CASE WHEN t.TransactionType = 'Debit' THEN t.Amount ELSE 0 END) AS TotalDebit
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
JOIN Transactions t ON a.AccountID = t.AccountID
GROUP BY c.Name;

-- Top 5 Merchants by Transaction Volume:
SELECT Merchant, COUNT(*) AS Transactions, SUM(Amount) AS TotalSpent
FROM Transactions
GROUP BY Merchant -- to see merchant wise trend
ORDER BY TotalSpent DESC
LIMIT 5;

-- Detecting Fraud Rate by City: 
SELECT
    c.City,
    COUNT(t.TransactionID) AS TotalTransactions,
    SUM(CASE WHEN t.IsFraud = 1 THEN 1 ELSE 0 END) AS FraudTransactions,
    ROUND(100 * SUM(CASE WHEN t.IsFraud = 1 THEN 1 ELSE 0 END) / COUNT(t.TransactionID), 2) AS FraudRatePct
FROM Transactions t
JOIN Accounts a ON t.AccountID = a.AccountID
JOIN Customers c ON a.CustomerID = c.CustomerID
GROUP BY c.City;

-- Revenue Analysis – Average Debit Per Customer:
SELECT
    c.Name,
    AVG(t.Amount) AS AvgDebit
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID
JOIN Transactions t ON a.AccountID = t.AccountID
WHERE t.TransactionType = 'Debit'
GROUP BY c.Name;

-- Customers with No Transactions:
SELECT c.Name
FROM Customers c
LEFT JOIN Accounts a ON c.CustomerID = a.CustomerID
LEFT JOIN Transactions t ON a.AccountID = t.AccountID
WHERE t.TransactionID IS NULL;

-- TRIGGERS:-

-- 1. Create Audit Table:
CREATE TABLE Transaction_Audit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    TransactionID INT,
    Action VARCHAR(10),
    ActionDate DATETIME
);

-- 2. Trigger to Log Inserts
DELIMITER $$

CREATE TRIGGER trg_audit_transaction_insert
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    INSERT INTO Transaction_Audit (TransactionID, Action, ActionDate)
    VALUES (NEW.TransactionID, 'INSERT', NOW());
END $$

DELIMITER ;


select * from Transaction_Audit;