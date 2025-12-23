/*
584. Find Customer Referee
*/

select name
from Customer 
where referee_id not in (2)
or referee_id is null;
