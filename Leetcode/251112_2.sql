/*
1341. Movie Rating
*/


select name as results
from
    (select u.name
          , row_number() over (order by count(r.movie_id) desc, u.name asc ) as rn
    from MovieRating r
    left join Users u
    on r.user_id = u.user_id 
    group by u.name)
where rn = 1
union all
select title as result
from 
    (select m.title
          , avg(r.rating) as rate
          , row_number() over (order by avg(r.rating) desc, m.title asc ) as rn
    from MovieRating r
    left join Movies m
    on r.movie_id = m.movie_id
    where r.created_at  between '2020-02-01' and '2020-02-29'
    group by m.title)
where rn =1
