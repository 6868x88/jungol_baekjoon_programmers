
/*
185. Department Top Three Salaries
*/

select   a.Department
        ,a.Employee
        ,a.salary
from
(select  d.name as Department 
        , e.name as Employee 
        , e.salary
        , dense_rank () over (partition by d.name order by salary desc) as rn
from Employee e
join Department d
on e.departmentId = d.id
) a
WHERE a.rn <= 3;
