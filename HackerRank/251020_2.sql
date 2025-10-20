/*
Weather Observation Station 5
*/


select city, length(city)
from
((select city, row_number () over (order by length(city), city) as num from station)
union all
(select city, row_number () over (order by length(city) desc, city) as num from station)
)
where num = 1
;
