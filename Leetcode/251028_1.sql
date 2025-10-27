/*
3673. Find Zombie Sessions
*/

-- 처음 쿼리 - 불필요한 중복 스캔이 많음, FIRST_VALUE/LAST_VALUE는 적합하지 않은 선택(중복 제거가 필요함)
with cnt as
(select session_id, user_id
    	, count(case when event_type = 'scroll' then 1 end) as scroll_count
        , count(case when event_type = 'click' then 1 end) as click_count
        , count(case when event_type = 'purchase' then 1 end) as purchase_cnt
    from app_events
    group by session_id, user_id)
, session_min as
(select session_id 
        , event_timestamp
        , FIRST_VALUE(event_timestamp) over (partition BY session_id order by event_timestamp asc
                              rows between unbounded preceding and unbounded following) as first_time
        , LAST_VALUE(event_timestamp)  OVER (partition BY session_id order by event_timestamp asc
                              rows between unbounded preceding and unbounded following) as last_time
from app_events
group by session_id, event_timestamp)
select distinct c.session_id
       , c.user_id
       , ROUND((TO_DATE(s.last_time, 'YYYY-MM-DD HH24:MI:SS') 
               - TO_DATE(s.first_time, 'YYYY-MM-DD HH24:MI:SS')) * 24 * 60, 2) as session_duration_minutes 
       , c.scroll_count 
from cnt c
join session_min s
on c.session_id = s.session_id
where  ROUND((TO_DATE(s.last_time, 'YYYY-MM-DD HH24:MI:SS') 
             - TO_DATE(s.first_time, 'YYYY-MM-DD HH24:MI:SS')) * 24 * 60, 2) >= 30
and c.scroll_count >=5
and c.click_count/c.scroll_count < 0.2
and c.purchase_cnt = 0
order by c.scroll_count desc, c.session_id asc


-- 수정 쿼리
with cnt as
(select session_id, user_id
    	, count(case when event_type = 'scroll' then 1 end) as scroll_count
        , count(case when event_type = 'click' then 1 end) as click_count
        , count(case when event_type = 'purchase' then 1 end) as purchase_cnt
    from app_events
    group by session_id, user_id)
, session_min as
(select session_id 
        , min(event_timestamp) as first_time
        , max(event_timestamp) as last_time
from app_events
group by session_id)
select   c.session_id
       , c.user_id
       , ROUND((s.last_time - s.first_time) * 24 * 60, 2) as session_duration_minutes 
       , c.scroll_count 
from cnt c
join session_min s
on c.session_id = s.session_id
where ROUND((s.last_time - s.first_time) * 24 * 60, 2) >= 30
and c.scroll_count >=5
and c.click_count/c.scroll_count < 0.2
and c.purchase_cnt = 0
order by c.scroll_count desc, c.session_id asc
