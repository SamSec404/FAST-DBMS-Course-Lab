DROP DATABASE IF EXISTS lab_11_task;
CREATE DATABASE lab_11_task;
USE lab_11_task;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    balance DECIMAL(10,2),
    account_type VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    from_account INT,
    to_account INT,
    amount DECIMAL(10,2),
    transaction_date DATETIME,
    status VARCHAR(20),
    FOREIGN KEY (from_account) REFERENCES accounts(account_id),
    FOREIGN KEY (to_account) REFERENCES accounts(account_id)
);

INSERT INTO customers VALUES
(1, 'Ali Khan', 'Lahore'),
(2, 'Sara Ahmed', 'Karachi'),
(3, 'John Smith', 'London');

INSERT INTO accounts VALUES
(101, 1, 5000.00, 'Savings'),
(102, 2, 3000.00, 'Current'),
(103, 3, 7000.00, 'Savings');

CREATE VIEW account_summary AS
SELECT 
    account_id,
    balance,
    account_type
FROM accounts;

CREATE VIEW transaction_summary AS
SELECT 
    transaction_id,
    from_account,
    to_account,
    amount,
    transaction_date,
    status
FROM transactions;