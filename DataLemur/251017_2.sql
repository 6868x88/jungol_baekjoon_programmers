/*
Marketing Touch Streak
3주 연속 마케팅 경험 존재하는 사람의 이메일 추출
*/


with id as (select contact_id
            from marketing_touches
            where event_type = 'trial_request'),
    tmp as (SELECT contact_id
                  , event_type
                  , event_date
                  , LAG (event_date, 2) over(partition by contact_id order by event_date) as pre_date
            FROM marketing_touches)

select c.email
from tmp t
join id i on t.contact_id = i.contact_id
join crm_contacts c on t.contact_id = c.contact_id
where t.pre_date + 13 <= t.event_date
;
