SELECT * FROM customers;
SELECT * FROM orders;

SELECT * FROM customers WHERE id = 1;


SELECT * FROM customers
WHERE country IN ('France', 'Germany', 'Italy');

SELECT * FROM customers
WHERE country = 'USA' or country = 'Germany';

SELECT * FROM customers
WHERE first_name LIKE 'M%';

SELECT * FROM customers c
CROSS JOIN orders o

USE salesdb;

show tables;

SELECT o.orderid, c.firstname, p.product, o.sales, p.price, e.firstname FROM orders o
LEFT JOIN customers c
ON o.customerid = c.customerid
LEFT JOIN products p
ON o.productid = p.productid
LEFT JOIN employees e
ON o.salespersonid = e.employeeid;

SELECT * FROM customers c;

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
    TABLE_SCHEMA = 'salesdb'
    AND REFERENCED_TABLE_NAME IS NOT NULL;

SELECT * FROM products p;

SELECT * FROM employees e;

use MyDatabase;