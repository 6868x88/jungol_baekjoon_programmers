/*
Patient Support Analysis (Part 3)
*/

select count(DISTINCT policy_holder_id)
from
(SELECT policy_holder_id
      , call_date
      , LAG(call_date) over (PARTITION by policy_holder_id order by call_date) as pre_call_date
FROM callers 
) a
where EXTRACT(DAY FROM (call_date - pre_call_date)) <7
;
