CREATE DATABASE BOOK_MANAGEMENT;
USE BOOK_MANAGEMENT;
CREATE TABLE CUSTOMER (
ID INT AUTO_INCREMENT NOT NULL,
USER_NAME VARCHAR (50) NOT NULL,
FULL_NAME VARCHAR(50) NOT NULL,
PHONE_NUMBER VARCHAR (11) NOT NULL,
EMAIL VARCHAR(50) NOT NULL,
PASSWORD VARCHAR (50) NOT NULL,
ADDRESS VARCHAR (100) NOT NULL,
PRIMARY KEY(ID)
);
CREATE TABLE STAFF (
ID INT AUTO_INCREMENT NOT NULL,
USER_NAME VARCHAR (50) NOT NULL,
FULL_NAME VARCHAR(50) NOT NULL,
PHONE_NUMBER VARCHAR (11) NOT NULL,
EMAIL VARCHAR(50) NOT NULL,
PASSWORD VARCHAR (50) NOT NULL,
ADDRESS VARCHAR (100) NOT NULL,
PRIMARY KEY(ID)
);
CREATE TABLE BOOK (
ID INT AUTO_INCREMENT NOT NULL,
NAME VARCHAR(50) NOT NULL,
TYPE VARCHAR(50) NOT NULL,
PUBLISH_DATE VARCHAR(50) NOT NULL,
DETAIL VARCHAR(500) NOT NULL,
PRICE INT NOT NULL,
QUANTITY INT NOT NULL,
PRIMARY KEY(ID)
);