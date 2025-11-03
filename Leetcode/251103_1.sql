/*
184. Department Highest Salary
*/


SELECT a.Department
        , a.Employee
        , a.salary
FROM
(SELECT d.name as Department 
       , e.name as Employee 
       , e.salary
       , DENSE_RANK () OVER (PARTITION BY e.departmentId ORDER BY salary DESC) AS RN 
FROM Employee e
JOIN Department d
ON e.departmentId = d.id) a
WHERE a.rn = 1
;
