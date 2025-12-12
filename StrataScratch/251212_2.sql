/*
Consecutive Days
*/

select user_id
from
(select user_id
    , record_date
    , lag(record_date,2) over (partition by user_id order by record_date) as pre_date
from sf_events
)
where record_date -2  = pre_date
;
