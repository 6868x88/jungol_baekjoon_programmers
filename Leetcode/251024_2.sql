/*
176. Second Highest Salary
*/

select max(case when a.rn = 2 then a.salary
            else null end) as SecondHighestSalary 
from(
  select 
    salary 
    , dense_rank() over (order by salary desc) as rn
  from Employee) a
;
