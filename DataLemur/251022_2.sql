/*
Reactivated Users
*/

with timetb as(
SELECT user_id
      , extract(month from login_date) as month
      , login_date
      , LAG(extract(month from login_date)) over (PARTITION by user_id order by login_date) as last_month
FROM user_logins
)

select month
      , count(user_id)
from timetb
where month > last_month +1
or last_month is null
group by month
order by month
;
