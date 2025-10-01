/*인사 분석가로서 직접 관리자보다 더 많은 수입을 올리는 모든 직원을 식별하라는 요청을 받습니다. 결과에는 직원의 ID와 이름이 포함되어야 합니다.*/
select a.employee_id, a.name as employee_name
from employee a
join 
(select employee_id, salary
from employee
where manager_id is null) b
on a.manager_id = b.employee_id
where a.salary > b.salary
;
