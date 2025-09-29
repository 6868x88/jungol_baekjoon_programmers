/*Sending vs. Opening Snaps*/

with tb as (select a.age_bucket, b.activity_type, b.time_spent
from age_breakdown a,
     activities b
where a.user_id = b.user_id
and b.activity_type in ('open', 'send')
)
select age_bucket 
      ,round(sum(case when activity_type = 'send' then time_spent else 0 end )/sum(time_spent)*100.0,2) as send_perc
      ,round(sum(case when activity_type = 'open' then time_spent else 0 end )/sum(time_spent)*100.0,2) as open_perc
from tb
group by age_bucket
;
