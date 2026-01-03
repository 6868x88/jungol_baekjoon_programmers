/* 1141. User Activity for the Past 30 Days I */
select to_char(activity_date, 'YYYY-MM-DD') as day
      , count(distinct user_id) as active_users 
from Activity 
where activity_date between '2019-06-28' and '2019-07-27'
and activity_type in ('open_session', 'end_session', 'scroll_down', 'send_message')
group by activity_date
order by activity_date
