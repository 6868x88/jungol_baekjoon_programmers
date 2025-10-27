/*
180. Consecutive Numbers
*/

select distinct num as ConsecutiveNums
from
(select num
    , id
    , lead(id) over (partition by num order by id) as aft_id
    , lag(id) over (partition by num order by id) as pre_id
from logs)
where id = pre_id + 1
and id = aft_id - 1
