/*
1164. Product Price at a Given Date
*/

-- 처음 쿼리
with date_table as(
    select  product_id
          , new_price
          , change_date
          , row_number() over(partition by product_id order by change_date desc ) as rn
    from Products 
    where change_date  <= '2019-08-16')
select product_id, new_price as price
from date_table
where rn = 1
union all
select distinct product_id, 10 as price
from Products
where product_id not in (select product_id from date_table )

-- 수정 쿼리

select 
    p.product_id,
    coalesce(dt.new_price, 10) as price
from (
    select distinct product_id from Products
) p
left join (
    select 
        product_id,
        new_price,
        row_number() over(partition by product_id order by change_date desc) as rn
    from Products
    where change_date <= '2019-08-16'
) dt on p.product_id = dt.product_id and dt.rn = 1;
