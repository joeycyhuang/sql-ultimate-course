SELECT * FROM sales.orders;

use SalesDB;

SELECT
    orderid,
    sales,
    quantity,
    sales/ NULLIF(quantity, 0) as price
FROM sales.orders;

SELECT DISTINCT c.* from sales.customers c
LEFT JOIN sales.orders as o
ON c.customerid = o.customerid
WHERE o.orderid is null;


WITH orders_cte as(
    select 1 id, 'A' category UNION
    SELECT 2 , NULL UNION
    select 3, '' UNION
    select 4, ' '
)
SELECT
    *,
    DATALENGTH(category) as category_length,
    DATALENGTH(TRIM(category)) as policy1
from orders_cte;

SELECT
sales_category,
SUM(sales) as total_sales
FROM (
    SELECT
        orderid,
        sales,
        CASE 
            WHEN sales>50 THEN 'HIGH'  
            WHEN sales>20 THEN 'MEDIUM'
            ELSE 'LOW'
        END sales_category
    FROM sales.orders
)t
GROUP BY sales_category;


select 
    employeeid,
    firstname,
    lastname,
    gender,
    CASE
        WHEN gender = 'M' THEN 'Male'
        WHEN gender = 'F' THEN 'Female'
        ELSE 'Unknown'
    END gender_category
 from sales.employees;

-- 9. Try with explicit schema from the results above
-- (Replace 'schema_name' with actual schema from step 6)
-- SELECT * FROM [schema_name].[orders];

SELECT CONVERT(DATETIME2()('PST', 'EST', '2018-12-21 13:42:11');

SELECT 
    orderid,
    orderdate,
    productid,
    SUM(sales) OVER (PARTITION BY productid) as TotalSalesByProducts
FROM sales.orders;

s


SELECT
    productid,
    count(*) over (PARTITION BY productid)
FROM sales.orders;

select
    sum(sales) over (order by datepart(month, orderdate) ) ,
    datepart(month, orderdate) as month
from sales.orders
group by datepart(month, orderdate)
order by datepart(month, orderdate);

SELECT 
t.*,
19 as price
FROM (
    SELECT 
    productid,
    price,
    AVG(price) over () avg_price
    FROM sales.products
) AS t
WHERE price > avg_price;

SELECT
    *,
    RANK() OVER (ORDER BY total_sales DESC) as rank
FROM(
    SELECT 
        customerid,
        SUM(sales) total_sales
    FROM sales.orders
    GROUP BY customerid
)t
