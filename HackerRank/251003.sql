select aa.name
from
(select a.id, a.name, c.salary
from students a, packages c
where a.id= c.id) aa,
(select a.id, b.friend_id, c.salary as fri_salary
from students a, friends b, packages c
where a.id = b.id
and b.friend_id = c.id) bb
where aa.id = bb.id
and bb.fri_salary > aa.salary
order by bb.fri_salary
;
