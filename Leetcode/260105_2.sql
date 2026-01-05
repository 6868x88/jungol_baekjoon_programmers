/*
3642. Find Books with Polarized Opinions
*/

/* Write your PL/SQL query statement below */
with result as(
    select book_id 
          , max(session_rating) - min(session_rating) as rating_spread
          , round(sum(case when session_rating = 3 then 0 else 1 end) / count(*), 2) as polarization_score 
    from reading_sessions 
    group by book_id 
    having count(book_id) > 4
    and sum(case when session_rating in (1,2) then 1 else 0 end) > 0
    and sum(case when session_rating in (4,5) then 1 else 0 end) > 0
)
select b.*
      , r.rating_spread
      , r.polarization_score
from result r
join books b
on r.book_id = b.book_id
where polarization_score >= 0.6
order by r.polarization_score desc, b.title desc
