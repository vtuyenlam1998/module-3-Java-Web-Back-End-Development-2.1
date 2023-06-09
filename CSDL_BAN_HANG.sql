USE QUANLYBANHANG;
INSERT INTO CUSTOMER VALUES (1,'Minh Quan',10);
INSERT INTO CUSTOMER VALUES (2,'Ngoc Oanh',20);
INSERT INTO CUSTOMER VALUES (3,'Hong Ha',50);
ALTER TABLE ORDERS MODIFY COLUMN OTOTALPRICE INT;
ALTER TABLE ORDERS MODIFY OTOTALPRICE INT NOT NULL;
INSERT INTO ORDERS (OID,CID,ODATE,OTOTALPRICE) VALUES (1,1,'2006-3-21',NULL);
SELECT * FROM ORDERS;
INSERT INTO ORDERS (OID,CID,ODATE,OTOTALPRICE) VALUES (2,2,'2006-3-23',NULL);
INSERT INTO ORDERS (OID,CID,ODATE,OTOTALPRICE) VALUES (3,1,'2006-3-16',NULL);
ALTER TABLE PRODUCT MODIFY COLUMN PPRICE INT;
INSERT INTO PRODUCT (PID,PNAME,PPRICE) VALUES (1,'May Giat',3);
INSERT INTO PRODUCT (PID,PNAME,PPRICE) VALUES (2,'Tu Lanh',5);
INSERT INTO PRODUCT (PID,PNAME,PPRICE) VALUES (3,'Dieu Hoa',7);
INSERT INTO PRODUCT (PID,PNAME,PPRICE) VALUES (4,'Quat',1);
INSERT INTO PRODUCT (PID,PNAME,PPRICE) VALUES (5,'Bep Dien',2);
INSERT INTO ORDERDETAIL (OID,PID,ODQTY) VALUES (1,1,3);
INSERT INTO ORDERDETAIL (OID,PID,ODQTY) VALUES (1,3,7);
INSERT INTO ORDERDETAIL (OID,PID,ODQTY) VALUES (1,4,2);
INSERT INTO ORDERDETAIL (OID,PID,ODQTY) VALUES (2,1,1);
INSERT INTO ORDERDETAIL (OID,PID,ODQTY) VALUES (3,1,8);
INSERT INTO ORDERDETAIL (OID,PID,ODQTY) VALUES (2,5,4);
INSERT INTO ORDERDETAIL (OID,PID,ODQTY) VALUES (2,3,3);
SELECT OID, ODATE, OTOTALPRICE FROM ORDERS;
SELECT C.CID, C.CNAME, P.PNAME, OD.ODQTY
FROM CUSTOMER C JOIN ORDERS O ON C.CID = O.CID JOIN ORDERDETAIL OD ON O.OID = OD.OID JOIN PRODUCT P ON OD.PID = P.PID;
ALTER TABLE PRODUCT MODIFY PNAME VARCHAR(50);
ALTER TABLE ORDERDETAIL MODIFY ODQTY INT;
SELECT 
    C.CID, C.CNAME, C.CAGE
FROM
    CUSTOMER C
        LEFT JOIN
    ORDERS O ON C.CID = O.CID
WHERE
    O.CID IS NULL;
SELECT O.OID, O.ODATE, SUM(P.PPRICE * OD.ODQTY) AS TONG_GIA_TIEN_HOA_DON
FROM ORDERS O
 JOIN
ORDERDETAIL OD ON O.OID = OD.OID
 JOIN
PRODUCT P ON OD.PID = P.PID
GROUP BY OD.OID;
