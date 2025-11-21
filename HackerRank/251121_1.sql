/*
Weather Observation Station 20
*/


select round(LAT_N,4) 
from
  (select ID, LAT_N,row_number() over (order by LAT_N) as row_num
  from station) a,
  (select ceil(count(ID)/2) as med from station) b
where a.row_num = b.med
;
