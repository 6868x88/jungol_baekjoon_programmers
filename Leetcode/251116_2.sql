/*
3421. Find Students Who Improved
*/

WITH ranked AS (
  SELECT student_id, subject, score, exam_date,
         ROW_NUMBER() OVER (
            PARTITION BY student_id, subject ORDER BY exam_date
         ) AS rn,
         ROW_NUMBER() OVER (
            PARTITION BY student_id, subject ORDER BY exam_date DESC
         ) AS rn_desc
  FROM Scores
)
SELECT student_id, subject,
       MIN(CASE WHEN rn = 1 THEN score END) AS first_score,
       MIN(CASE WHEN rn_desc = 1 THEN score END) AS latest_score
FROM ranked
GROUP BY student_id, subject
HAVING COUNT(*) > 1
   AND MIN(CASE WHEN rn_desc = 1 THEN score END)
     > MIN(CASE WHEN rn = 1 THEN score END)
ORDER BY student_id, subject;
