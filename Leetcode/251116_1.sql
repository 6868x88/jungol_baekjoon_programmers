/*
3220. Odd and Even Transactions
*/

select 
       to_char(transaction_date, 'YYYY-MM-DD') as transaction_date
      , sum(case when mod(amount, 2) = 1 then amount else 0 end) as odd_sum  
      , sum(case when mod(amount, 2) = 0 then amount else 0 end) as even_sum 
from transactions 
group by transaction_date
order by transaction_date
