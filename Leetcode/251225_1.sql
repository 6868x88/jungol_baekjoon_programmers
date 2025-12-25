/*
577. Employee Bonus
*/

/* Write your PL/SQL query statement below */
select e.name
     , b.bonus
from Employee e
full outer join Bonus b
on e.empId = b.empId 
where b.bonus is null
or b.bonus < 1000
