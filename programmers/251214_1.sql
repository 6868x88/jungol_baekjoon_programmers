/*
자동차 대여 기록에서 대여중 / 대여 가능 여부 구분하기
*/

with rental as (
    SELECT distinct car_id
    ,'대여중' as AVAILABILITY
from CAR_RENTAL_COMPANY_RENTAL_HISTORY
where to_char(START_DATE,'YYYY-MM-DD') <= '2022-10-16'
and to_char(END_DATE, 'YYYY-MM-DD') >= '2022-10-16'
)
select distinct car_id
       , '대여 가능' as AVAILABILITY
from CAR_RENTAL_COMPANY_RENTAL_HISTORY
where car_id not in (select car_id from rental)
union all
select *
from rental
order by  1 desc
