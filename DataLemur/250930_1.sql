/*
아마존 고객과 다양한 카테고리의 제품에 대한 지출 데이터가 포함된 표가 주어졌다고 가정하고, 2022년 각 카테고리에서 가장 높은 수익을 올린 상위 2개 제품을 식별하기 위한 쿼리를 작성하세요. 출력에는 카테고리, 제품 및 총 지출이 포함되어야 합니다.
*/

select a.category 
      , a.product
      , a.total_spend
from(
select category
	,product
	,sum(spend) as total_spend
	,row_number() over(partition by category order by sum(spend) desc) as spd_num
from product_spend
where EXTRACT(year FROM transaction_date) = '2022'
group by category, product
) a
where a.spd_num < 3
;
