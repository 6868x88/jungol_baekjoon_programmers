/*
Y-on-Y Growth Rate
전년도 대비 지출 비교 (이전 연도 값이 없을 경우 null)
*/


-- 첫번째 쿼리 : full scan 2번이라 비효율적
with year_tb as 
(SELECT product_id
      , spend
      , extract (year from transaction_date) as year_spend
      , row_number () over (partition by product_id order by transaction_date) as rn
from user_transactions)
(select  extract (year from b.transaction_date) as year
      , b.product_id
      , b.spend as curr_year_spend
      , a.spend as prev_year_spend
      , - round((100.0 - 100.0*(b.spend/a.spend)),2) as yoy_rate
from year_tb a -- 과거
join user_transactions b -- 현재
on a.product_id = b.product_id
where extract (year from b.transaction_date) -1 = a.year_spend)
union ALL
(SELECT year_spend
      , product_id
      , spend as curr_year_spend
      , null as prev_year_spend
      , null as yoy_rate
from year_tb a
where a.rn = 1)
order by product_id, year
;

-- 두번째 쿼리 : LAG 함수 이용해서 좀 더 간결한 문장 / 다만 단건 한정으로 간편한 쿼리 추후 보정 필요
with result as
(select 
      extract (year from transaction_date) as year
			, product_id
			, spend as curr_year_spend
			, LAG(spend) over (partition by product_id) as prev_year_spend
			from user_transactions
)
select 
       year
       , product_id
       , curr_year_spend
       , prev_year_spend
       , case when prev_year_spend is null then NULL
              else - round((100.0 - 100.0*(curr_year_spend/prev_year_spend)),2) 
              end as yoy_rate
from result
order by product_id, year
;
