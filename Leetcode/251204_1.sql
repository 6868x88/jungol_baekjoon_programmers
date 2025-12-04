/*
3657. Find Loyal Customers
*/

select customer_id
from customer_transactions 
group by customer_id
having count(case when transaction_type = 'purchase' then customer_id end) >= 3
and max(transaction_date) - min(transaction_date) >= 30
and count(case when transaction_type = 'refund' then customer_id end)/count(*) < 0.2
order by customer_id
