-- Deleting tables if already exists to avoid errors.
-- Step 1: Clean up any existing tables to avoid errors during creation
DROP TABLE IF EXISTS warehouses;
DROP TABLE IF EXISTS stock_Levels;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS stock_movements;
DROP TABLE IF EXISTS product_categories;
DROP TABLE IF EXISTS products;

-- Step 2 Create the tables 

-- 1. Product Categories: Stores product details, each linked to a category

CREATE TABLE product_categories (
category_id INT PRIMARY KEY AUTO_INCREMENT,
category_name VARCHAR (200) UNIQUE
);


-- 2. Create products table: Stores product details, each linked to a category
CREATE TABLE products (
product_id INT PRIMARY KEY AUTO_INCREMENT,
category_id INT,
SKU VARCHAR(200) NOT NULL UNIQUE,
product_name varchar(200) NOT NULL,
description TEXT,
unit_price DECIMAL (10, 2) NOT NULL,
FOREIGN KEY (category_id) REFERENCES product_categories (category_id)
);

-- 3. Create warehouses table: Stores information about warehouse locations
CREATE TABLE warehouses (
warehouse_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
name VARCHAR(100) UNIQUE,
location VARCHAR(200) NOT NULL 
);

-- 4.Create the users table: Tracks system users who perform inventory actions
CREATE TABLE users (
user_id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(100) NOT NULL UNIQUE,
email VARCHAR(100) NOT NULL UNIQUE,
role ENUM ('admin', 'staff') DEFAULT 'staff'
);

-- 5. Create stock movements: Logs stock moving in/out of warehouses
CREATE TABLE stock_movements (
movement_id INT PRIMARY KEY AUTO_INCREMENT,
product_id INT NOT NULL,
warehouse_id INT NOT NULL,
performed_by INT,
movement_type ENUM('IN', 'OUT') NOT NULL,
quantity INT NOT NULL CHECK (quantity > 0),
movement_date DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (product_id) REFERENCES products(product_id),
FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id),
FOREIGN KEY (performed_by) REFERENCES users(user_id)
);

-- 6. Create the  stock_levels: Tracks quantity of each product in each warehouse
CREATE TABLE stock_levels (
product_id INT NOT NULL,
warehouse_id INT NOT NULL,
quantity INT NOT NULL DEFAULT 0,
PRIMARY KEY (product_id, warehouse_id),
FOREIGN KEY  (product_id) REFERENCES products(product_id),
FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);


