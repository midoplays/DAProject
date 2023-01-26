CREATE DATABASE onlShop;
USE onlShop;


-- TABLES CREATION ------------------------------------
DROP TABLE product;
CREATE TABLE Product(
	product_id INT,
    date_added DATE,
    price DOUBLE,
    image TEXT,
    brand VARCHAR(20),
    model VARCHAR(20),
    quantity INT,
    name VARCHAR(100),
    discount_amount INT,
    date_updated DATE,
    
    PRIMARY KEY (product_id)
);

DROP TABLE customer;
CREATE TABLE Customer(
	user_id INT AUTO_INCREMENT,
    email VARCHAR(50),
    password VARCHAR(10),
    balance DOUBLE,
    username VARCHAR(20),
    Bdate DATE,
    Fname VARCHAR(20),
    Lname VARCHAR(20),
    floor INT,
    street VARCHAR(30),
    area VARCHAR(30),
    city VARCHAR(30),
    country VARCHAR(30),
    
    PRIMARY KEY (user_id)
);


DROP TABLE VIEWS;
CREATE TABLE Views(
	user_id INT,
    product_id INT,
    times_viewed INT,
    
    FOREIGN KEY (user_id) REFERENCES Customer(user_id)
		ON DELETE RESTRICT 
		ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
		ON DELETE RESTRICT
		ON UPDATE CASCADE,
    PRIMARY KEY (user_id, product_id)
);

DROP TABLE Order_;
CREATE TABLE Order_(
	order_id INT,
    total_price DOUBLE,
    payment_method ENUM('Visa', 'Cash'),
    floor INT,
    street VARCHAR(30),
    area VARCHAR(30),
    city VARCHAR(30),
    country VARCHAR(30),
    dateTime_placed DATETIME,
    customer_id INT,
    
    FOREIGN KEY (customer_id) REFERENCES Customer(user_id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    PRIMARY KEY (order_id)
);


DROP TABLE category_;
CREATE TABLE Category_(
	product_id INT,
    category VARCHAR(20),
    
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (product_id)
);

DROP TABLE containment;
CREATE TABLE Containment(
	product_id INT,
    order_id INT,
    amount INT,
    
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
		ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (order_id) REFERENCES Order_(order_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (product_id, order_id)
);


DROP TABLE seller;
CREATE TABLE Seller(
	user_id INT,
    email VARCHAR(50),
    password VARCHAR(10),
    username VARCHAR(20),
    name VARCHAR(50),
    floor INT,
    street VARCHAR(30),
    area VARCHAR(30),
    city VARCHAR(30),
    country VARCHAR(30),
    
    PRIMARY KEY (user_id)
);


DROP TABLE sells;
CREATE TABLE Sells(
	Product_id INT,
    user_id INT,
    
    FOREIGN KEY (Product_id) REFERENCES Product(product_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Seller(user_id)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (product_id, user_id)
);