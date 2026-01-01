/*
1251. Average Selling Price
*/

select p.product_id
    , nvl(round(sum(p.price * u.units) / sum(u.units), 2), 0) as average_price 
from Prices  p
left join UnitsSold  u
on p.product_id = u.product_id
and u.purchase_date <= p.end_date   
and u.purchase_date >= p.start_date
group by p.product_id
