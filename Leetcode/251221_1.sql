/*
197. Rising Temperature
*/

select id
from
(select id 
    , recordDate 
    , lag(recordDate) over(order by recordDate  ) as lag_date
    , temperature 
    , lag(temperature) over(order by recordDate  ) as lag
from Weather)
where temperature > lag 
and recordDate = lag_date + 1
;
