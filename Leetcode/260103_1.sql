/*
1084. Sales Analysis III
*/

select s.product_id  
      , p.product_name 
from 
    (select product_id 
          , max(sale_date) as sale_date  
    from Sales 
    group by product_id 
    having max(sale_date) <= '2019-03-31'
    and min(sale_date) >= '2019-01-01') s
join Product p
on p.product_id  = s. product_id  
