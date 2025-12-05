/* Write your PL/SQL query statement below */
/*
3705. Find Golden Hour Customers
*/

--불필요한 연산이 있어서 추후 튜닝 필요 
with peak as(
    select customer_id 
          , count(*) as cnt
    from restaurant_orders
    where to_char(order_timestamp, 'HH24:MI') between '11:00' and '14:00'
    or to_char(order_timestamp, 'HH24:MI') between '18:00' and '21:00'
    group by customer_id
    ) -- 피크타임 주문
select r.customer_id 
      , count(r.customer_id) as total_orders 
      , round(p.cnt * 1.0/count(*) * 100) as peak_hour_percentage 
      , round(sum(r.order_rating)/count(r.order_rating), 2) as average_rating 
from restaurant_orders r
join peak p on r.customer_id = p.customer_id
group by r.customer_id, p.cnt
having count(*) > 2 -- 최소 3개 이상 주문 
and round(sum(r.order_rating)/count(r.order_rating), 2) >= 4.0 -- 주문 평균 평점 4.0 이상
and count(r.order_rating)/count(r.customer_id) >= 0.5 -- 주문 절반 이상 평가
and p.cnt * 1.0/count(*) >= 0.6
order by 4 desc, 1 desc
;
