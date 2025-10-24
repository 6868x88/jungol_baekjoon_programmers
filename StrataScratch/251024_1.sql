/*
New Products
- 오라클 풀이
- postgresql일 경우 조건절에 윈도우 함수 가능
*/

SELECT *
FROM (
  SELECT company_name,
         COUNT(product_name)
           - LAG(COUNT(product_name)) OVER (PARTITION BY company_name ORDER BY year) AS net_products
  FROM car_launches
  GROUP BY company_name, year
) a
WHERE a.net_products IS NOT NULL
ORDER BY a.company_name;
