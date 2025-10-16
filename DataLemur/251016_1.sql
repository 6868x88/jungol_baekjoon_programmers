/*
Active User Retention
2022-07 의 활성화 유저 수 찾기 - 조건에서 월을 지정했기 때문에 하드코딩함
*/

SELECT 7 as month
      , count(DISTINCT b.user_id) as monthly_active_users
from 
  (select user_id
    from user_actions
    where EXTRACT(month from event_date) = 6) a
join user_actions b
on a.user_id = b.user_id
where EXTRACT(month from b.event_date) = 6
;
