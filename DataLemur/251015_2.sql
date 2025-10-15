/*
International Call Percentage
국제 통화 비율 구하기
*/

select round(100.0*count(*) FILTER (WHERE r.country_id != c.country_id) /count(*), 1) as result
from phone_calls p
left join phone_info c
on p.caller_id = c.caller_id
left join phone_info r
on p.receiver_id = r.caller_id
;
