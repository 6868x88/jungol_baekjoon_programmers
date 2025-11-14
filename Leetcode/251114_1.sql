/*
1934. Confirmation Rate
*/

/* Write your PL/SQL query statement below */
with confirmed_table as(
    select s.user_id
         , case when c.action = 'confirmed' then 1 else 0 end as confirm_cnt
    from Signups s
    left join Confirmations c
    on s.user_id = c.user_id
)
, cnt_table as(
    select c.user_id
         , count(c.confirm_cnt) as cnt
         , sum(c.confirm_cnt) as sum_cnt
    from confirmed_table c
    group by c.user_id
)
select user_id
     , case when sum_cnt != 0 then round(sum_cnt/cnt,2) else 0 end as confirmation_rate 
from cnt_table
