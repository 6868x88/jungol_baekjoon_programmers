/*
1907. Count Salary Categories
*/


/* Write your PL/SQL query statement below */
with category_table as (
    select account_id
       , income
       , case when income < 20000 then 'Low Salary'
              when income > 50000 then 'High Salary'
              else 'Average Salary' end as category
from Accounts)
    , category_list as(
        select 'Low Salary' as category from dual
        union all
        select 'High Salary' as category from dual
        union all
        select 'Average Salary' as category from dual
    )
    , cnt_table as(
        select category
        , count(*) as cnt
        from category_table 
        group by category)
select l.category
      , nvl(c.cnt, 0) as accounts_count 
from cnt_table c
right join category_list l
on c.category = l.category 
