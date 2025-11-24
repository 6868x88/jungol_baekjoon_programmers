/*
3580. Find Consistently Improving Employees
*/

/* Write your PL/SQL query statement below */
-- 추후 튜닝 필요 / 불필요한 스캔이 많음 
with id as(
    select distinct employee_id
    from performance_reviews 
    group by employee_id
    having count(*) >= 3
), rn_table as(
select r.employee_id
    , r.review_date 
    , r.rating 
    , nvl(lag(r.rating) over (partition by r.employee_id order by r.review_date desc) - r.rating, 1) as diff
    , row_number() over (partition by r.employee_id order by r.review_date desc) as rn
from performance_reviews r
join id i
on r.employee_id = i.employee_id
), result as(
select employee_id 
    , max(case when rn = 1 then rating end) - max(case when rn = 3 then rating end) as improvement_score 
from rn_table
where rn < 4
and diff > 0
group by employee_id )
select s.employee_id
    , e.name
    , s.improvement_score 
from result s
join employees e
on s.employee_id = e.employee_id
where s.improvement_score is not null
and s.improvement_score != 0
order by s.improvement_score desc, e.name
