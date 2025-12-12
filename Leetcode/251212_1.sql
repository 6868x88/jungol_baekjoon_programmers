/*
181. Employees Earning More Than Their Managers
*/

select  p.name as Employee 
from Employee e -- 매니저
left join Employee p -- 부하직원
on e.id = p.managerID
and e.salary < p.salary
where p.name is not null
