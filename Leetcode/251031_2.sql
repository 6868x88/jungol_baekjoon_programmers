/*
626. Exchange Seats
- 이전에 같은 유형 푼 적 있음
*/

with total_id as (
   select count(id) as cnt 
   from Seat 
) , swap_id as (
   select
   case 
      when mod(id, 2) = 0 then id - 1 
      when id < (select cnt from total_id) then id + 1 
      else id
    end as new_id
    , student 
  from Seat)
select new_id as id, student
from swap_id
order by id
;
