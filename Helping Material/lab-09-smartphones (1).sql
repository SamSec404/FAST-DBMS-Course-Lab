DROP DATABASE IF EXISTS lab_09_task;
CREATE DATABASE lab_09_task;
USE lab_09_task;

CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE smartphones (
    phone_id INT PRIMARY KEY,
    model_name VARCHAR(100),
    brand_id INT,
    price DECIMAL(10,2),
    release_year INT,
    battery_capacity INT,
    rating DECIMAL(3,1),
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    phone_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (phone_id) REFERENCES smartphones(phone_id)
);

CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    phone_id INT,
    customer_id INT,
    rating INT,
    review_text VARCHAR(255),
    FOREIGN KEY (phone_id) REFERENCES smartphones(phone_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO brands VALUES
(1, 'Apple', 'USA'),
(2, 'Samsung', 'South Korea'),
(3, 'Xiaomi', 'China'),
(4, 'OnePlus', 'China'),
(5, 'Google', 'USA');

INSERT INTO smartphones VALUES
(1, 'iPhone 14', 1, 999, 2022, 3279, 4.8),
(2, 'iPhone 13', 1, 799, 2021, 3240, 4.6),
(3, 'Galaxy S23', 2, 899, 2023, 3900, 4.7),
(4, 'Galaxy A54', 2, 499, 2023, 5000, 4.3),
(5, 'Redmi Note 12', 3, 299, 2023, 5000, 4.2),
(6, 'Mi 11', 3, 599, 2021, 4600, 4.4),
(7, 'OnePlus 11', 4, 699, 2023, 5000, 4.5),
(8, 'Pixel 7', 5, 799, 2022, 4355, 4.7);

INSERT INTO customers VALUES
(1, 'Ali Khan', 'Lahore', 'Pakistan'),
(2, 'Sara Ahmed', 'Karachi', 'Pakistan'),
(3, 'John Smith', 'London', 'UK'),
(4, 'Maria Garcia', 'Madrid', 'Spain');

INSERT INTO orders VALUES
(1, 1, '2023-10-01'),
(2, 2, '2023-10-05'),
(3, 1, '2023-11-10'),
(4, 3, '2023-11-15');

INSERT INTO order_items VALUES
(1, 1, 1, 1),
(2, 1, 5, 2),
(3, 2, 3, 1),
(4, 3, 7, 1),
(5, 4, 2, 1);

INSERT INTO reviews VALUES
(1, 1, 1, 5, 'Excellent'),
(2, 3, 2, 4, 'Good'),
(3, 5, 1, 4, 'Value for money'),
(4, 7, 4, 5, 'Amazing'),
(5, 2, 4, 3, 'Average');