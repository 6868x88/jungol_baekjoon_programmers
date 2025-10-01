/**/

select round((sqrt(a+b)),4)
from(
 select  power((max(LAT_N) - min(LAT_N)),2) as a
        ,power((max(LONG_W)-min(LONG_W)),2) as b
 from station
)
;
