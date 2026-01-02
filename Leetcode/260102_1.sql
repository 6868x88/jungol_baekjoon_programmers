/*
607. Sales Person
*/

(select s.name
from SalesPerson s)
minus
(select s.name
from SalesPerson s
left join Orders o on s.sales_id  = o.sales_id 
join Company c on o.com_id = c.com_id
where c.name = 'RED')
