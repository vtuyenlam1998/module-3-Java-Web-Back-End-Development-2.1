USE CLASSICMODELS;
SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 
EXPLAIN SELECT * FROM CUSTOMERS WHERE CUSTOMERNAME ='Land of Toys Inc.';
ALTER TABLE customers ADD INDEX idx_customerName(customerName);
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';
ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';