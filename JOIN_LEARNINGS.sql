SELECT * FROM CUSTOMER
SELECT * FROM ORDERS
SELECT * FROM SHIPPINGS

CREATE TABLE Customer (
    CID SERIAL PRIMARY KEY,
    Cname VARCHAR(50),
    Age INT,
    Country VARCHAR(50)
);

INSERT INTO Customer (CID, Cname, Age, Country) VALUES
(1, 'Abhay', 32, 'INDIA'),
(2, 'Abhishek', 47, 'USA'),
(3, 'Yash', 22, 'USA'),
(4, 'Mansi', 34, 'INDIA'),
(5, 'Mayank', 65, 'UK');



CREATE TABLE Orders (
    OID VARCHAR(10) PRIMARY KEY,
    ITEM VARCHAR(50),
    AMOUNT INT,
    CID INT,
    ODATE DATE,
    FOREIGN KEY (CID) REFERENCES Customer(CID)
);

-- Insert data into Orders table
INSERT INTO Orders (OID, ITEM, AMOUNT, CID, ODATE) VALUES
('O1', 'MOUSE', 350, 1, '2024-08-08'),
('O2', 'MONITOR', 5000, 2, '2024-08-08'),
('O3', 'LAPTOP', 70000, 1, '2024-08-15'),
('O4', 'MOUSE', 350, 3, '2024-08-15'),
('O5', 'MONITOR', 5000, 2, '2024-08-25');




CREATE TABLE Shippings (
    ShipmentID VARCHAR(10) PRIMARY KEY,
    STATUS VARCHAR(50),
    CID INT,
    FOREIGN KEY (CID) REFERENCES Customer(CID)
);

-- Insert data into Shippings table
INSERT INTO Shippings (ShipmentID, STATUS, CID) VALUES
('S1', 'Pending', 1),
('S2', 'Delivered', 2),
('S3', 'Pending', 1),
('S4', 'Delivered', 3),
('S5', 'Delivered', 2);








-- 1/ 

SELECT * 
FROM Customer 
WHERE AGE BETWEEN 25 AND 52


--2/ Display how many customer placed order ?

SELECT COUNT(DISTINCT(CID)) FROM ORDERS

--3 / Display the customer names whose name starts with A.

SELECT Cname AS peopleWithStartingNameA
FROM Customer
WHERE Cname LIKE('A%')


--4 Display how many customers are there who are from USA.


SELECT Country AS PeopleFromUSA
FROM Customer
WHERE Country = 'USA'

-- 5/ Display the number of products ordered.

SELECT COUNT(OID) FROM Orders

-- 6/ Display  product wise number of orders placed.


SELECT ITEM, COUNT(CID) 
FROM ORDERS
GROUP BY ITEM

-- 7/ Display the customer details who have placed orders.

SELECT DISTINCT C.CID, C.Cname, C.Age, C.Country
FROM Customer C
JOIN Orders O ON C.CID = O.CID
ORDER BY C.Cname



--8 /Display the customer details who have not placed any orders.


-- Display all orders along with the customer details who placed them.





SELECT C.Cname,C.Age,C.Country,O.Item
FROM Customer C
JOIN Orders O ON O.CID = C.CID


-- List all customers who have placed orders, but show only their names and countries

SELECT DISTINCT C.Cname, C.Country 
FROM Customer C
JOIN Orders O ON O.CID = C.CID

-- Show all customers along with their order details,
-- including those who haven’t placed any orders.

SELECT C.Cname, C.Country , C.Age, O.OID, O.Item , O.Amount
FROM Customer C
LEFT JOIN Orders O on O.CID = C.CID

--List all the shipments along with 
--the customer details for those customers who have received shipments.



SELECT S.ShipmentID ,S.STATUS , C.Cname,C.Country
FROM Shippings S
JOIN Customer C ON S.CID = C.CID


--Display the details of customers who have placed more than one order.


SELECT C.Cname,C.Country,C.Age , COUNT(O.OID) AS orderCount
FROM Customer C
JOIN Orders O ON O.CID = C.CID
GROUP BY C.CID, C.Cname
HAVING COUNT(O.OID) > 1


-- Find customers who have placed an order for "MOUSE".

SELECT C.Cname AS CustomerName
FROM Customer C
JOIN Orders O ON O.CID = C.CID
GROUP BY C.Cname

--Show customers who have not placed any orders and their details.

SELECT C.Cname , C.Country, C.Age 
FROM Customer C
LEFT JOIN Orders O ON O.CID = C.CID
WHERE O.OID IS NULL


-- List all orders along with their shipment status and customer details\
SELECT O.OID, O.ITEM, O.AMOUNT, S.STATUS, C.CID, C.Cname
FROM Orders O
JOIN Shippings S ON O.CID = S.CID
JOIN Customer C ON O.CID = C.CID
ORDER BY O.OID;

-- Count the number of shipments for each customer
--and display customer details

SELECT C.CID, C.Cname, COUNT(S.ShipmentID) AS ShipmentCount
FROM Customer C
LEFT JOIN Shippings S ON C.CID = S.CID
GROUP BY C.CID, C.Cname
ORDER BY C.CID DESC


--  Find customers who live in "USA" and have placed an order.

SELECT DISTINCT C.Cname 
FROM Customer C
JOIN Orders O ON O.CID = C.CID
WHERE C.Country = 'USA'








































 