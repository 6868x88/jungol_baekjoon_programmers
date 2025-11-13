
/*
1393. Capital Gain/Loss
*/

select stock_name
        ,sum(case when operation = 'Buy' then -1 * price
              else price end) as CAPITAL_GAIN_LOSS 
from Stocks
group by stock_name
