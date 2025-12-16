-- 코드를 입력하세요
with sell_user as(
    select WRITER_ID
          , sum(PRICE) as TOTAL_SALES
    from USED_GOODS_BOARD 
    where status = "DONE"
    group by WRITER_ID
    having sum(PRICE) >= 700000
)
select s.WRITER_ID
        , u.NICKNAME
        , s.TOTAL_SALES
from sell_user s
join USED_GOODS_USER u
on s.WRITER_ID = u.USER_ID
order by 3 asc
