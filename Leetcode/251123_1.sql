/*
3601. Find Drivers with Improved Fuel Efficiency
*/

/* Write your PL/SQL query statement below */
with trip as (
    select driver_id
           , case when extract(month from trip_date) < 7 then 'first_half'
             else 'second_half' end as season
           , distance_km / fuel_consumed as result
    from trips)
, trip_result as (
    select driver_id
            , season
            , sum(result)/count(result) as avg_result
    from trip
    where driver_id in (  select driver_id
                          from trip
                          group by driver_id
                          having count(distinct season) = 2)
    group by driver_id, season
)
select *
from (select  r.driver_id
        , d.driver_name   
        , round(MAX(CASE WHEN r.season = 'first_half' THEN r.avg_result END), 2) AS first_half_avg
        , round(MAX(CASE WHEN r.season = 'second_half' THEN r.avg_result END), 2) AS second_half_avg
        , round(MAX(CASE WHEN r.season = 'second_half' THEN r.avg_result END) -  MAX(CASE WHEN r.season = 'first_half' THEN r.avg_result END), 2) as efficiency_improvement 
from trip_result r
join drivers d on r.driver_id = d.driver_id
group by r.driver_id, d.driver_name)
where efficiency_improvement > 0
order by 5 desc, 2 asc
