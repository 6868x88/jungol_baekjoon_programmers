/*
오랜 기간 보호한 동물(1)
*/

-- 코드를 입력하세요
select name
    , DATETIME
from 
(SELECT name
      , DATETIME
      , row_number() over (order by datetime) as rn
from ANIMAL_INS 
where ANIMAL_ID not in (select ANIMAL_ID from ANIMAL_OUTS)
)
where rn < 4
order by rn
;
