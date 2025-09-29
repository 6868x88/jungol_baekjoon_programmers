/* Weather Observation Station 16 */

/*
WITH challenges_cnt as (
SELECT hacker_id, 
       count(hacker_id) as cnt, 
       rank() over(order by count(hacker_id) desc) as rnk
from challenges 
group by hacker_id
)
select a.hacker_id, b.name, a.cnt
from (select b.hacker_id, b.cnt
from challenges_cnt b
where rnk in (select rnk
from challenges_cnt
group BY rnk
having count(rnk) = 1)
    or rnk = 1
)a, hackers b
where a.hacker_id = b.hacker_id
order by a.cnt desc, b.hacker_id asc
;
*/

WITH challenges_cnt AS (
    SELECT 
        hacker_id,
        COUNT(*) AS cnt,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk,
        COUNT(*) OVER (PARTITION BY COUNT(*)) AS cnt_dup
    FROM challenges
    GROUP BY hacker_id
)
SELECT 
    c.hacker_id, 
    h.name, 
    c.cnt
FROM challenges_cnt c
JOIN hackers h ON c.hacker_id = h.hacker_id
WHERE c.rnk = 1
   OR c.cnt_dup = 1
ORDER BY c.cnt DESC, c.hacker_id ASC;
