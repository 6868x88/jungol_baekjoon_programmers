(SELECT a.X, a.Y
FROM functions a
INNER JOIN functions b
    ON a.X = b.Y AND a.Y = b.X
WHERE a.X < a.Y)
union
(select x, y
from functions
where x = y
group by x,y
having count(x) = 2)
order by x;
