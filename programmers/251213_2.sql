/*
특정 기간동안 대여 가능한 자동차들의 대여비용 구하기
*/
select distinct c.car_id
        , c.car_type
        , (c.daily_fee *(100-p.DISCOUNT_RATE)/100)*30 as fee
from CAR_RENTAL_COMPANY_CAR c
left join CAR_RENTAL_COMPANY_RENTAL_HISTORY h 
on c.car_id = h.car_id
left join CAR_RENTAL_COMPANY_DISCOUNT_PLAN p 
on c.car_type = p.car_type
where c.car_id not in (
                        select car_id
                        from CAR_RENTAL_COMPANY_RENTAL_HISTORY 
                        where to_char(start_date, 'YYYY-MM-DD') <= '2022-11-30'
                        and to_char(end_date, 'YYYY-MM-DD') >= '2022-11-01' )
and c.car_type in ('세단', 'SUV')
and p.DURATION_TYPE = '30일 이상'
and (c.daily_fee *(100-p.DISCOUNT_RATE)/100)*30 between 500000 and 1999999
order by 3 desc, 2 asc, 1 desc
;
