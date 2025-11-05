/*
Print Prime Numbers
*/

WITH Numbers AS (
    SELECT LEVEL AS n
    FROM dual
    CONNECT BY LEVEL <= 1000
),
pri as (SELECT a.n
FROM Numbers a
WHERE a.n > 1
  AND NOT EXISTS (
      SELECT 1
      FROM Numbers b
      WHERE b.n > 1
        AND b.n < a.n
        AND MOD(a.n, b.n) = 0
  )
)
select listagg(n, '&') within GROUP (order by n)
from pri
;
