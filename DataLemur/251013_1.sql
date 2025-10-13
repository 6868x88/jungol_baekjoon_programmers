/*
Swapped Food Delivery
12/34/56 같이 홀수/짝수 행 페어들 서로 바꾸기 (마지막 홀수 행은 그대로)
*/

-- 초안 쿼리 : 불필요한 중복 스캔이 많음
with total_order as 
  (select count(order_id) as cnt from orders)
(select (order_id-1) as order_id, item
  from orders
  where mod(order_id, 2) = 0)
union all
(select (order_id+1) as order_id, item
  from orders, total_order
  where mod(order_id, 2) = 1
  and order_id != total_order.cnt)
union ALL
(select order_id, item 
  from orders, total_order 
  where order_id = total_order.cnt)
order by order_id
; 

-- 수정 쿼리
with total_order as 
  (select count(order_id) as cnt 
   from orders) ,
  swap_id as 
  (select
   case 
      when mod(order_id, 2) = 0 then order_id - 1 
      when order_id < (select cnt from total_order) then order_id + 1 
      else order_id
    end as new_order_id,
    item
  from orders)
select new_order_id as order_id, item
from swap_id
order by new_order_id
;
