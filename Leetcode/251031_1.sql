/*
3554. Find Category Recommendation Pairs
*/

WITH product AS (
	SELECT user_id
          , category
	FROM ProductPurchases p
	JOIN ProductInfo p1 
    ON p.product_id = p1.product_id
), main_proccess AS (
	SELECT P.category AS category1
         , P1.category AS category2
         , COUNT( DISTINCT P.user_id ) as customer_count 
	FROM product P  
    JOIN product P1 
    ON P.category < P1.category 
    AND P.user_id = P1.user_id
	GROUP BY P.category, P1.category
	HAVING(COUNT(DISTINCT P.user_id)) > 2
)
SELECT category1
     , category2
     , customer_count
FROM main_proccess
ORDER BY customer_count DESC, category1, category2
