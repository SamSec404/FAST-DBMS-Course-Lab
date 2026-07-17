DROP DATABASE IF EXISTS lab_12_task;
CREATE DATABASE lab_12_task;
USE lab_12_task;

-- Weapons Master
CREATE TABLE weapons (
    weapon_id INT PRIMARY KEY,
    weapon_name VARCHAR(100),
    category VARCHAR(50),
    unit_cost DECIMAL(10,2),
    min_required_stock INT
);

-- Bases
CREATE TABLE bases (
    base_id INT PRIMARY KEY,
    base_name VARCHAR(100)
);

-- Inventory per base
CREATE TABLE base_inventory (
    base_id INT,
    weapon_id INT,
    quantity INT,
    PRIMARY KEY (base_id, weapon_id),
    FOREIGN KEY (base_id) REFERENCES bases(base_id),
    FOREIGN KEY (weapon_id) REFERENCES weapons(weapon_id)
);

-- Procurement Orders
CREATE TABLE procurement_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    weapon_id INT,
    quantity INT,
    order_date DATETIME,
    status VARCHAR(20)
);

-- Transfers
CREATE TABLE transfers (
    transfer_id INT AUTO_INCREMENT PRIMARY KEY,
    weapon_id INT,
    from_base INT,
    to_base INT,
    quantity INT,
    transfer_date DATETIME
);

-- SAMPLE DATA
INSERT INTO weapons VALUES
(1, 'Assault Rifle', 'Firearm', 1200, 80),
(2, 'Sniper Rifle', 'Firearm', 5000, 30),
(3, 'Drone System', 'Aerial', 25000, 10);

INSERT INTO bases VALUES
(1, 'Alpha'),
(2, 'Bravo');

INSERT INTO base_inventory VALUES
(1,1,50),
(1,2,20),
(2,1,40),
(2,3,5);