/*
부서 내 '고소득자'는 해당 부서 내 상위 3개 급여 중 급여 순위가 높은 직원으로 정의됩니다.
모든 부서에서 이러한 고소득자를 식별하는 임무를 맡았습니다. 쿼리를 작성하여 직원의 이름과 부서 이름 및 급여를 표시합니다. 중복되는 경우 부서 이름의 결과를 오름차순으로 정렬한 다음 급여를 내림차순으로 정렬합니다. 여러 직원이 동일한 급여를 받는 경우 알파벳 순으로 정렬합니다.
*/

select a.department_name
	, b.name
	, b.salary 
from  department a
INNER JOIN 
(select name 
        ,dense_rank() over(partition by department_id order by salary desc ) as rnk
        ,salary
        ,department_id
from employee) b
on a.department_id = b.department_id
where b.rnk <4
order by a.department_name asc, b.salary desc, b.name asc
;
