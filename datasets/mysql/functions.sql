select LOWER(first_name) as low_name, country, CONCAT(first_name, ' ', country) as full_name from customers;

UPDATE customers
SET 
    first_name = TRIM(first_name)
where first_name like ' %';

select 
    country,
    LENGTH(TRIM(SUBSTRING(country, 2, 2))) as SUBSTRING_LEN
from customers;