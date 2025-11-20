/*
The PADS
*/



/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/


 select name || '(' || substr(occupation,1,1) || ')'
from occupations
order by name, substr(occupation,1,1)
;
select 'There are a total of ' || count(occupation) || ' ' || Lower(occupation) ||'s.'
from occupations
group by occupation
order by count(occupation) asc, occupation asc
;
