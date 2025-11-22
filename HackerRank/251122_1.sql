/*
3521. Find Product Recommendation Pairs
*/

with product as (
    select a.user_id
	       , a.product_id as product1_id 
	       , b.product_id as product2_id 
    from ProductPurchases a
join ProductPurchases b 
on a.user_id = b.user_id 
and a.product_id < b.product_id
), cnt as(
    select product1_id
           , product2_id
           , count(*) as customer_count 
    from product
    group by product1_id , product2_id
    having count(*) >=3
)
select c.product1_id 
      , c.product2_id 
      , i.category as product1_category 
      , ii.category as product2_category 
      , c.customer_count 
from cnt c
join ProductInfo i on c.product1_id = i.product_id 
join ProductInfo ii on c.product2_id = ii.product_id
order by c.customer_count desc, product1_id, product2_id 
