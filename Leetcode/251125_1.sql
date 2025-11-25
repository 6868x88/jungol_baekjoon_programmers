/*
570. Managers with at Least 5 Direct Reports
*/

select b.name
from 
(select managerId  
from Employee
group by managerId
having count(managerId) >= 5
) a
join  Employee b
on a.managerId = b.id
