/*
3716. Find Churn Risk Customers
*/

WITH cte AS (
    SELECT
        user_id,
        event_date,
        event_type,
        plan_name,
        monthly_amount,
        MAX(event_date) OVER (PARTITION BY user_id) AS max_date,
        MAX(event_date) OVER (PARTITION BY user_id)
            - MIN(event_date) OVER (PARTITION BY user_id) AS days_as_subscriber,
        MAX(monthly_amount) OVER (PARTITION BY user_id) AS max_historical_amount,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY event_date DESC, event_id DESC   -- 최신 이벤트 1개만
        ) AS rn
    FROM subscription_events
)

SELECT
      user_id,
      plan_name AS current_plan,
      monthly_amount AS current_monthly_amount,
      max_historical_amount,
      days_as_subscriber
FROM cte c
WHERE rn = 1                    
  AND days_as_subscriber > 59
  AND (monthly_amount / max_historical_amount) < 0.5
  AND plan_name IS NOT NULL
  AND EXISTS (
        SELECT 1
        FROM subscription_events s
        WHERE s.user_id = c.user_id
          AND s.event_type = 'downgrade'
      )
ORDER BY days_as_subscriber DESC, user_id ASC;
