/*
262. Trips and Users
*/

with cancle as
    (select t.request_at as tripday
         , case when t.status = 'completed' then 1 
               else 0 end as status
    from trips t
    left join users u on t.client_id = u.users_id
    left join users uu on t.driver_id = uu.users_id
    where u.banned = 'No'
    and uu.banned = 'No'
    and t.request_at between '2013-10-01' and '2013-10-03')
select  tripday as day
       ,round(1-sum(status)/count(status),2) as "Cancellation Rate"
from cancle
group by tripday
order by tripday
;
