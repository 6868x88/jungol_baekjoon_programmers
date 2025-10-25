/*
1158. Market Analysis I
성능이 그닥 좋지 않아 튜닝 필요
*/

select
      u.user_id as buyer_id
    , to_char(u.join_date, 'YYYY-MM-DD') as join_date 
    , nvl(count(o.item_id),0) as orders_in_2019 
from Users u, Orders o, Items i
where u.user_id = o.buyer_id(+) 
and o.item_id = i.item_id(+)
and extract(year from o.order_date(+)) = '2019'
group by u.user_id, u.join_date 
;
