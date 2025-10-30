/*
3482. Analyze Organization Hierarchy
*/

-- 처음 쿼리: 일단 정답 제출용으로 푼 것이라 매우 비효율적(계층 쿼리를 너무 자주 불러내기 때문에 불필요한 스캔 발생), 또한 컬럼 숫자로 정렬하는 것이 안 되어서 또 다시 서브쿼리로 넣었는데 매우 좋지 못 함
  with roottb as(
    SELECT a.employee_id
           , a.manager_id
           , a.employee_name
           , a.salary
           , level as lv
    FROM employees a
    START WITH a.manager_id IS NULL
    CONNECT BY PRIOR a.employee_id = a.manager_id
)
select employee_id
        , employee_name
        , lv as "level"
        , team_size
        , budget
from
(SELECT e.employee_id
       , e.employee_name
       , e.lv 
       , (SELECT COUNT(*)
         FROM employees d
         START WITH d.manager_id = e.employee_id       
         CONNECT BY PRIOR d.employee_id = d.manager_id ) AS team_size
       , e.salary + nvl((
         SELECT sum(salary)
         FROM employees d
         START WITH d.manager_id = e.employee_id
         CONNECT BY PRIOR d.employee_id = d.manager_id),0) as budget 
from roottb e
)
order by lv, BUDGET desc, employee_name


-- 수정 쿼리
with c1 (employee_id, employee_name, salary, lv, start_id, start_name) as (
    select  employee_id, 
            employee_name, 
            salary, 
            1 as lv, 
            employee_id as start_id, 
            employee_name as start_name
    from    Employees
    union all
    select  a.employee_id, 
            a.employee_name, 
            a.salary, 
            b.lv + 1 as lv, 
            b.start_id, 
            b.start_name
    from    Employees a, c1 b
    where   b.employee_id = a.manager_id
), c2 as (
    select  employee_id, level lv
    from    Employees
    start with manager_id is null
    connect by prior employee_id = manager_id  
)
select  a.start_id as employee_id,
        min(a.start_name) as employee_name,
        min(b.lv) as "level",
        count(*) - 1 as team_size,
        sum(a.salary) as budget
from    c1 a, c2 b
where   b.employee_id = a.start_id
group by a.start_id
order by 3, 5 desc, 2

