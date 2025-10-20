/*
3-Topping Pizzas
*/

SELECT a.topping_name ||','|| b.topping_name ||','|| c.topping_name as pizza
     , a.ingredient_cost + b.ingredient_cost + c.ingredient_cost as total_cost
from pizza_toppings a
inner join pizza_toppings b on a.topping_name < b.topping_name
inner join pizza_toppings c on b.topping_name < c.topping_name
order by a.ingredient_cost + b.ingredient_cost + c.ingredient_cost desc, pizza
;
