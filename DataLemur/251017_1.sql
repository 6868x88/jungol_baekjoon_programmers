/*
Consecutive Filing Years
3년 연속 TurboTax 세금 신고한 유저 찾기
*/

select DISTINCT a.user_id
from (SELECT user_id
      , EXTRACT(year from filing_date) as year
      , LAG(EXTRACT(year from filing_date), 2) over (partition by user_id order by filing_date) as pprev_year
      FROM filed_taxes
      where product LIKE 'TurboTax%') a
where a.year - 2 = a.pprev_year
order by a.user_id
;
