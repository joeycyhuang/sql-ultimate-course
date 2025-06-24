SELECT * FROM Sales.Customers;

-- Find the total sales per customer

WITH CustomerSales AS (
    SELECT 
        customerid,
        SUM(sales) AS TotalSales,
        RANK() OVER (ORDER BY totalsales DESC) as rank_order
    FROM sales.orders
    GROUP BY customerid
),
LastOrder AS (
    SELECT 
        customerid,
        max(orderdate) as lastorderdate
    FROM sales.orders
    GROUP BY customerid
),
rank_order AS (
    SELECT
        customerid,
        RANK() OVER (ORDER BY totalsales DESC) as rank_order
    FROM CustomerSales
)
SELECT 
    c.customerid,
    c.firstname,
    c.lastname,
    cts.TotalSales,
    lo.lastorderdate,
    c.rank_order
FROM sales.customers c
LEFT JOIN CustomerSales cts
ON cts.customerid = c.customerid
LEFT JOIN LastOrder lo
ON lo.customerid = c.customerid
WHERE cts.totalsales > 0
ORDER BY ro.rank_order;


with series as (
    select
        1 as the_number
    union all
    select 
        the_number + 1
    from series
    where the_number < 10
)
select * from series;