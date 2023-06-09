create database CART_MANAGEMENT;
use CART_MANAGEMENT;
create table PRODUCT (
ID INT AUTO_INCREMENT,
NAME VARCHAR(255),
PRICE FLOAT,
DESCRIPTION TEXT,
IMAGE_URL VARCHAR(2000),
IS_DELETED BIT(1) DEFAULT 0,
PRIMARY KEY (ID)
);
create table SHOPPINGCART(
PRODUCT_ID INT AUTO_INCREMENT,
TITLE VARCHAR(255),
IMAGE VARCHAR(2000),
PRICE FLOAT,
IS_DELETED BIT(1) DEFAULT 0,
PRIMARY KEY (PRODUCT_ID),
FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT (ID)
);
create table CART(
PRODUCT_ID INT NOT NULL,
FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(ID)
);