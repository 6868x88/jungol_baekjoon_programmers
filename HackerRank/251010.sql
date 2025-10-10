
SELECT h.hacker_id,
       h.name,
       SUM(s.max_score) AS sc_sum
FROM hackers h
JOIN (
    SELECT hacker_id,
           challenge_id,
           MAX(score) AS max_score
    FROM submissions
    GROUP BY hacker_id, challenge_id
) s
  ON h.hacker_id = s.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(s.max_score) <> 0
ORDER BY sc_sum DESC, h.hacker_id ASC;
