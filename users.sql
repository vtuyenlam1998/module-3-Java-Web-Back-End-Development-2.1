CREATE DATABASE if not EXISTS DEMO;
USE DEMO;
CREATE TABLE USERS (
    ID INT(3) NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(120) NOT NULL,
    EMAIL VARCHAR(220) NOT NULL,
    COUNTRY VARCHAR(120),
    PRIMARY KEY (ID)
);
insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');