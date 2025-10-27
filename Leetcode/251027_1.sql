/*
602. Friend Requests II: Who Has the Most Friends
*/


with cnt as 
(select accepter_id  as  id
from RequestAccepted
union all
select requester_id  as id
from RequestAccepted)
select id, num
from 
(select id
      ,count(id) as num
      ,rank () over (order by count(id) desc) as rn
from cnt
group by id)
where rn = 1
;
