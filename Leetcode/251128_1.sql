/*
3611. Find Overbooked Employees
*/

WITH weekly AS (
    SELECT
        employee_id,
        TRUNC(meeting_date, 'IW') AS week_start,
        SUM(duration_hours) AS total_hours
    FROM meetings
    GROUP BY employee_id, TRUNC(meeting_date, 'IW')
)
SELECT 
    e.employee_id,
    e.employee_name,
    e.department,
    COUNT(*) AS meeting_heavy_weeks
FROM weekly w
JOIN employees e
    ON w.employee_id = e.employee_id
WHERE w.total_hours > 20
GROUP BY e.employee_id, e.employee_name, e.department
HAVING COUNT(*) > 1   
ORDER BY meeting_heavy_weeks DESC, e.employee_name ASC;
