select 
    p.productid,
    p.product,
    p.price,
    (select count(*) from sales.orders) as total_orders
from sales.products p

select 
productid,
price 
from sales.products
where price > (select avg(price) from sales.products);