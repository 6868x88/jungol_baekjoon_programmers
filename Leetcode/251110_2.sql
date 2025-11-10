/*
1174. Immediate Food Delivery II
*/

SELECT 
    ROUND(COUNT(DISTINCT CASE 
                     WHEN rn = 1 AND order_date = customer_pref_delivery_date 
                     THEN customer_id 
                   END) * 100 
     / COUNT(DISTINCT customer_id), 2) AS immediate_percentage 
FROM (
    SELECT customer_id,
           order_date,
           customer_pref_delivery_date,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM Delivery
)
