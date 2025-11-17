/*
3497. Analyze Subscription Conversion 
*/

with paid_user as (
    select distinct user_id
from UserActivity 
where activity_type = 'paid'
)
select u.user_id
     , round(sum(case when u.activity_type = 'free_trial' then activity_duration end)
     /count(case when u.activity_type = 'free_trial' then activity_duration end), 2) as trial_avg_duration 
     , round(sum(case when u.activity_type = 'paid' then activity_duration end)
     /count(case when u.activity_type = 'paid' then activity_duration end), 2) as paid_avg_duration 
from UserActivity u 
join paid_user p
on u.user_id = p.user_id
group by u.user_id
order by u.user_id
