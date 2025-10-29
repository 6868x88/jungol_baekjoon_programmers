/*
Contest Leaderboard
*/

SELECT a.hacker_id, b.name, a.sc_sum
from
(select hacker_id, sum(sc) as sc_sum
from(select hacker_id, challenge_id, max(score) as sc
     from submissions
     group by hacker_id, challenge_id)
GROUP BY hacker_id) a,
hackers b
where a.hacker_id = b.hacker_id
and a.sc_sum <>0
order by a.sc_sum desc, a.hacker_id asc
;
