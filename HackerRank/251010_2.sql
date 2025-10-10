select a.company_code, a.founder, b.lman, b.sman, b.man, b.emp
from  company a
     ,(select  company_code
            ,count (distinct employee_code) as emp
            ,count (distinct manager_code) as man
            ,count (distinct senior_manager_code)as sman
            ,count (distinct lead_manager_code) as lman
        from employee
        group by company_code) b
where a.company_code = b.company_code(+)
order by a.company_code
;
