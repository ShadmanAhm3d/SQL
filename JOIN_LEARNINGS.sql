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




--(Date : 29 october)
-- Create tables for the dataset
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    customer_id INT REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    total_price DECIMAL(10, 2)
);

-- Insert sample data into each table
INSERT INTO customers (first_name, last_name, email, phone, city) VALUES
('Alice', 'Johnson', 'alice@example.com', '555-1234', 'New York'),
('Bob', 'Smith', 'bob@example.com', '555-5678', 'Los Angeles'),
('Charlie', 'Brown', 'charlie@example.com', '555-8765', 'Chicago');

INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 999.99),
('Headphones', 'Electronics', 199.99),
('Coffee Maker', 'Appliances', 49.99),
('Desk Chair', 'Furniture', 89.99);

INSERT INTO orders (order_date, customer_id) VALUES
('2024-01-10', 1),
('2024-01-12', 2),
('2024-01-15', 1);

INSERT INTO order_items (order_id, product_id, quantity, total_price) VALUES
(1, 1, 1, 999.99),
(1, 2, 1, 199.99),
(2, 3, 1, 49.99),
(3, 1, 2, 1999.98),
(3, 4, 1, 89.99);

--Write a query to retrieve each customer's first and last name along 
--with the date of each order they placed.

SELECT c.first_name,c.last_name,o.order_date
FROM customers c
INNER JOIN orders o
 ON c.customer_id = o.customer_id


--For each order, list the customer's name, 
--order date, product name, quantity ordered, and the total price for that item.

SELECT c.first_name, o.order_date,p.product_name,oi.quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON p.product_id = oi.product_id

--Calculate the total amount each customer has spent across all their orders.

SELECT c.first_name , SUM(oi.total_price)
FROM customers c
INNER JOIN orders o ON o.customer_id = c.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY c.first_name


--Find orders where the total value of all items is greater than $500. 
--Include the customer’s name, order ID, order date, and the total order amount.

SELECT c.first_name,o.order_id,o.order_date, SUM(oi.total_price)
FROM customers c
INNER JOIN orders o ON o.customer_id = c.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.first_name,o.order_id,o.order_date
HAVING SUM(oi.total_price) > 500;

























































 
