/*
601. Human Traffic of Stadium
*/


WITH tmp AS (
  SELECT id,
         LEAD(id) OVER (ORDER BY id) AS next_id,
         LAG(id) OVER (ORDER BY id) AS pre_id,
         LEAD(id, 2) OVER (ORDER BY id) AS next2_id,
         LAG(id, 2) OVER (ORDER BY id) AS pre2_id,
         TO_CHAR(visit_date,'YYYY-MM-DD') AS visit_date,
         people
  FROM Stadium
  WHERE people >= 100
)
SELECT id, visit_date, people
FROM tmp
WHERE (id + 1 = next_id AND id + 2 = next2_id)
   OR (id - 1 = pre_id AND id - 2 = pre2_id)
   OR (id - 1 = pre_id AND id + 1 = next_id)
ORDER BY id;
