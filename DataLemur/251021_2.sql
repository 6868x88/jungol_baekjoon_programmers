/*
Patient Support Analysis (Part 4)
*/


with call AS(
SELECT EXTRACT(month from call_date) as month
      , count(call_duration_secs) as cnt
      , LAG(count(call_duration_secs)) over (order by EXTRACT(month from call_date)) as pre_cnt
FROM callers
where call_duration_secs >= 300
group by EXTRACT(month from call_date)
)

SELECT
      2023 as yr  -- 이미 테이블에 2023년 데이터만 있었기 때문에 빠르게 결과를 내기 위해 하드코딩함
      ,  MONTH as mth
      , round((100.0*(cnt-pre_cnt)/pre_cnt),1) as long_calls_growth_pct
from call
