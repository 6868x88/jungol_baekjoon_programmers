/*3808. Find Emotionally Consistent Users*/


/* Write your PL/SQL query statement below */
with usertb as (
    select user_id
          , count(*) as total_reaction 
    from reactions 
    group by user_id 
    having count(*) > 4
    )
select u.user_id
    , r.reaction as dominant_reaction 
    , round(count(r.reaction) * 1.00 /u.total_reaction, 2) as reaction_ratio
from usertb u
join reactions r
on u.user_id = r.user_id 
group by u.user_id, r.reaction, u.total_reaction
having count(r.reaction)/u.total_reaction >= 0.6
order by 3 desc, 1 asc;
