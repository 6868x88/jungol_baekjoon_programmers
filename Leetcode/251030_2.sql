/*
1070. Product Sales Analysis III
*/


-- row_number의 경우 같은 데이터(year)있을 경우 임의로 하나만 선택하기 때문에 오답으로 처리됨
select a.product_id
        , a.year as "first_year"
        , a.quantity 
        , a.price 
from
(select product_id
        , year
        , quantity 
        , price 
        , rank() over (partition by product_id order by year) as rn
from sales) a
where a.rn = 1;
