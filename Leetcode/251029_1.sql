/*
3451. Find Invalid IP Addresses
*/

--우선 정답에선 넘어갔지만 옥텟 4개인 ip들만 추출하는 쿼리(좀 더 정확한 조건으로 바꾸면 좀 더 느려짐)
with oct as(
    select ip
         , REGEXP_SUBSTR(ip,'[^.]+' ,1, 1) as oct1
         , REGEXP_SUBSTR(ip,'[^.]+' ,1, 2) as oct2
         , REGEXP_SUBSTR(ip,'[^.]+' ,1, 3) as oct3
         , REGEXP_SUBSTR(ip,'[^.]+' ,1, 4) as oct4
         , length(ip) - length(replace(ip, '.', '')) AS dot_cnt  
    from logs
)
select ip
    , count(ip) as invalid_count
from logs
where ip not in
             (select ip
              from oct
              where to_number(oct1) between 1 and 255 
              and to_number(oct2) between 1 and 255
              and to_number(oct3) between 1 and 255 
              and to_number(oct4) between 1 and 255
              and oct1 not like '0%'
              and oct2 not like '0%'
              and oct3 not like '0%'
              and oct4 not like '0%'
              and dot_cnt = 3 )
group by ip
order by count(ip) desc, ip desc
