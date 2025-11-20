/*
Ollivander's Inventory
*/

select a.id, b.age, a.coins_needed, a.power
from wands a
    ,wands_property b
where a.code = b.code
and b.is_evil = 0
and a.coins_needed = (select min(coins_needed)
                      from wands c
                          ,wands_property d
                      where c.code= d.code
                      and d.is_evil=0
                      and a.power = c.power
                      and b.age = d.age)
order by a.Power desc, b.age desc
;
