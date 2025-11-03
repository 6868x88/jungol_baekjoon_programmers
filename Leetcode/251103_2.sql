/*
550. Game Play Analysis IV
*/

WITH first_day AS (
    SELECT player_id
         , MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
)
SELECT
    ROUND(COUNT(DISTINCT b.player_id) / COUNT(DISTINCT a.player_id), 2) AS fraction
FROM first_day a
LEFT JOIN Activity b
ON a.player_id = b.player_id
AND b.event_date = a.first_login + 1;
