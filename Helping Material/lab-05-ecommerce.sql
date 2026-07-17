DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS payments;

PRAGMA foreign_keys = ON;

-- Customers
CREATE TABLE IF NOT EXISTS customers (
    customer_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE,
    city TEXT,
    country TEXT,
    registration_date DATE
);

-- Suppliers
CREATE TABLE IF NOT EXISTS suppliers (
    supplier_id INTEGER PRIMARY KEY,
    supplier_name TEXT NOT NULL,
    country TEXT
);

-- Categories
CREATE TABLE IF NOT EXISTS categories (
    category_id INTEGER PRIMARY KEY,
    category_name TEXT NOT NULL
);

-- Products
CREATE TABLE IF NOT EXISTS products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category_id INTEGER,
    supplier_id INTEGER,
    price REAL NOT NULL,
    stock_quantity INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Orders
CREATE TABLE IF NOT EXISTS orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date DATE,
    status TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Order Items (Bridge Table)
CREATE TABLE IF NOT EXISTS order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    unit_price REAL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
        ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
        ON DELETE CASCADE
);

-- Payments
CREATE TABLE IF NOT EXISTS payments (
    payment_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    payment_date DATE,
    payment_method TEXT,
    amount REAL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
        ON DELETE CASCADE
);

-- Insert Statements
INSERT INTO customers VALUES
(1, 'Ali', 'Khan', 'ali@example.com', 'Lahore', 'Pakistan', '2023-01-10'),
(2, 'Sara', 'Ahmed', 'sara@example.com', 'Karachi', 'Pakistan', '2023-03-15'),
(3, 'John', 'Smith', 'john@example.com', 'London', 'UK', '2022-11-20'),
(4, 'Maria', 'Garcia', 'maria@example.com', 'Madrid', 'Spain', '2023-07-05'),
(5, 'Chen', 'Wei', 'chen@example.com', 'Beijing', 'China', '2023-09-01');

INSERT INTO suppliers VALUES
(1, 'TechWorld Ltd', 'USA'),
(2, 'BookPlanet', 'UK'),
(3, 'FashionHub', 'Italy'),
(4, 'HomePro', 'Germany');

INSERT INTO categories VALUES
(1, 'Electronics'),
(2, 'Books'),
(3, 'Clothing'),
(4, 'Home Appliances');

INSERT INTO products VALUES
(1, 'Laptop Pro 15', 1, 1, 1200, 50),
(2, 'Wireless Mouse', 1, 1, 25, 200),
(3, 'Database Design Book', 2, 2, 40, 150),
(4, 'Winter Jacket', 3, 3, 150, 80),
(5, 'Microwave Oven', 4, 4, 300, 30),
(6, 'Smartphone X', 1, 1, 900, 70),
(7, 'Novel: The Last Query', 2, 2, 20, 100);

INSERT INTO orders VALUES
(1, 1, '2023-10-01', 'Shipped'),
(2, 2, '2023-10-05', 'Pending'),
(3, 1, '2023-11-10', 'Delivered'),
(4, 3, '2023-11-15', 'Cancelled'),
(5, 4, '2023-12-01', 'Delivered');

INSERT INTO order_items VALUES
(1, 1, 1, 1, 1200),
(2, 1, 2, 2, 25),
(3, 2, 3, 1, 40),
(4, 3, 6, 1, 900),
(5, 3, 2, 1, 25),
(6, 4, 7, 3, 20),
(7, 5, 4, 1, 150);

INSERT INTO payments VALUES
(1, 1, '2023-10-01', 'Credit Card', 1250),
(2, 3, '2023-11-10', 'PayPal', 925),
(3, 5, '2023-12-01', 'Credit Card', 150);