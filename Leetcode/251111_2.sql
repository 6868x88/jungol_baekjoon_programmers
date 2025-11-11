/*
1204. Last Person to Fit in the Bus
*/

select *
from
    (select a.person_name
     from
        (select turn
               , person_name 
               , weight 
               , sum(weight) over (order by turn range unbounded preceding) as total_weight
        from Queue) a
     where a.total_weight <=1000
     order by a.total_weight desc
    )
where rownum = 1
