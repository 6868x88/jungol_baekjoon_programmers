/*
Advertiser Status
*/

SELECT coalesce(a.user_id, d.user_id) as user_id --advertiser에 없는 기업이 있어서 null값 치환해줘야 함
      , case when a.user_id is null then 'NEW'
             when d.paid is null then 'CHURN'
             when d.paid is not null and a.status = 'CHURN' then 'RESURRECT'
             else 'EXISTING' end as now_st
FROM daily_pay d
full outer join advertiser a
on d.user_id = a.user_id
order by user_id;
