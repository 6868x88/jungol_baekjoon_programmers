/*
3564. Seasonal Sales Analysis
*/

/* Write your PL/SQL query statement below */
with seasontb as(
    select 1 as month , 'Winter' as season from dual
    union all
    select 2 as month , 'Winter' as season from dual
    union all
    select 3 as month , 'Spring' as season from dual
    union all
    select 4 as month , 'Spring' as season from dual
    union all
    select 5 as month , 'Spring' as season from dual
    union all
    select 6 as month , 'Summer' as season from dual
    union all
    select 7 as month , 'Summer' as season from dual
    union all
    select 8 as month , 'Summer' as season from dual
    union all
    select 9 as month , 'Fall' as season from dual
    union all
    select 10 as month , 'Fall' as season from dual
    union all
    select 11 as month , 'Fall' as season from dual
    union all
    select 12 as month , 'Winter' as season from dual
)
, result as(
    select 
       b.season
      , p.category
      , sum(quantity) as total_quantity 
      , sum(a.quantity * a.price) as total_revenue 
      , row_number() over (partition by season order by sum(quantity) desc, sum(a.quantity * a.price) desc) as rn
from sales a
join seasontb b on extract(month from a.sale_date) = b.month
join products p on a.product_id = p.product_id
group by b.season, p.category
)
select r.season
      , r.category
      , r.total_quantity
      , r.total_revenue 
from result r
where r.rn = 1
order by r.season


-- case when 처리
WITH base AS (
    SELECT 
        CASE 
            WHEN EXTRACT(MONTH FROM sale_date) BETWEEN 3 AND 5 THEN 'Spring'
            WHEN EXTRACT(MONTH FROM sale_date) BETWEEN 6 AND 8 THEN 'Summer'
            WHEN EXTRACT(MONTH FROM sale_date) BETWEEN 9 AND 11 THEN 'Fall'
            ELSE 'Winter'
        END AS season,
        p.category,
        a.quantity,
        a.quantity * a.price AS revenue
    FROM sales a
    JOIN products p ON a.product_id = p.product_id
),
result AS (
    SELECT 
        season,
        category,
        SUM(quantity) AS total_quantity,
        SUM(revenue) AS total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY season
            ORDER BY SUM(quantity) DESC, SUM(revenue) DESC
        ) AS rn
    FROM base
    GROUP BY season, category
)
SELECT season,
        category,
        total_quantity,
        total_revenue
FROM result
WHERE rn = 1
ORDER BY season;
