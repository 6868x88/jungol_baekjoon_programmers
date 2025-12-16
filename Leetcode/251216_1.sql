/*
183. Customers Who Never Order
*/

select name as Customers 
from Customers
where id not in 
(select c.id
from Customers c
join Orders o
on  c.id = o.customerId )
