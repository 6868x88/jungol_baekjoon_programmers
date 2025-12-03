/* Write your PL/SQL query statement below */
/*
3626. Find Stores with Inventory Imbalance
*/

with store_info as(
    select i.store_id
        , s.store_name    
        , s.location    
        , max(i.price) as max_price
        , min(i.price) as min_price
from inventory i
join stores s 
on i.store_id = s.store_id
group by i.store_id, s.store_name, s.location
having count(i.store_id) > 2
) ,result as(
    select t.store_id
        , t.store_name    
        , t.location
        , i.product_name 
        , i.quantity 
        , i.price
    from store_info t
    join inventory i 
    on t.store_id = i.store_id 
    and (t.max_price = i.price or t.min_price = i.price)
)
select r.store_id
      , r.store_name
      , r.location
      , r.product_name as most_exp_product
      , e.product_name as cheapest_product   
      , round(e.quantity/r.quantity, 2) as imbalance_ratio 
from result r --최대
join result e -- 최소값
on r.store_id = e.store_id 
and e.price < r.price
and r.quantity < e.quantity
order by 6 desc, 1 asc;
