/*
Highest Cost Orders
*/

with ordertb as (
select o.order_date
      , o.cust_id
      , sum(o.total_order_cost) as max_cost
      , dense_rank() over (PARTITION by o.order_date order by sum(o.total_order_cost) desc) as rn
from orders o
where o.order_date between '2019-02-01' and '2019-05-01'
group by o.order_date, o.cust_id
)

select c.first_name
        , o.order_date
        , o.max_cost
from ordertb o 
join customers c
on c.id = o.cust_id 
where o.rn = 1
order by o.order_date, c.first_name
