/*Write a query that identifies the customer IDs of these Supercloud customers. 각 카테고리별 1개 이상씩 주문한 고객 찾기*/

SELECT 
  c.customer_id
FROM customer_contracts c
JOIN products p
  ON c.product_id = p.product_id
GROUP BY c.customer_id
HAVING COUNT(DISTINCT p.product_category) >= 3;
