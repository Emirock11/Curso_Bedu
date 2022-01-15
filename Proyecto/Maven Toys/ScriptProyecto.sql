CREATE DATABASE proyecto;
USE proyecto;

CREATE TABLE products(
	id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(100),
    product_category VARCHAR(100),
    product_cost DECIMAL(10,2),
    product_price DECIMAL(10,2),
    PRIMARY KEY (id)
);

CREATE TABLE stores(
	id INT NOT NULL AUTO_INCREMENT,
    store_name VARCHAR(100),
    store_city VARCHAR(100),
    store_location VARCHAR(100),
    store_open_date DATE,
    PRIMARY KEY (id)
);

CREATE TABLE sales(
	id_sale INT NOT NULL AUTO_INCREMENT,
    id_store INT NOT NULL,
    id_product INT NOT NULL,
    units INT,
    PRIMARY KEY (id_sale),
    FOREIGN KEY (id_store) REFERENCES stores(id),
    FOREIGN KEY (id_product) REFERENCES products(id)
);

CREATE TABLE inventory (
	id_store INT NOT NULL,
    id_product INT NOT NULL,
    stock_on_hand INT,
    FOREIGN KEY (id_store) REFERENCES stores(id),
    FOREIGN KEY (id_product) REFERENCES products(id)
);

DESCRIBE products;
DESCRIBE stores;
DESCRIBE sales;
DESCRIBE inventory;