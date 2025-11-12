/*
1321. Restaurant Growth
*/


/* Write your PL/SQL query statement below */
with date_amount as(
    select visited_on
          , sum(amount) as amount
    from Customer
    group by visited_on
), amount_table as 
    (select visited_on
    	, sum(amount) over (order by visited_on rows between 6 preceding and CURRENT row) as total_amount
    	, LAG(visited_on, 6) over(order by visited_on) as lag_date
    from date_amount)
select to_char(visited_on, 'YYYY-MM-DD') as visited_on 
      , total_amount as amount
      , round(total_amount/7, 2) as average_amount 
from amount_table
where lag_date is not null
order by visited_on
