/*
3465. Find Products with Valid Serial Numbers
*/

SELECT *
FROM products
WHERE REGEXP_LIKE(description, '(^|[^A-Z0-9])SN[0-9]{4}-[0-9]{4}([^0-9]|$)')
ORDER BY product_id;
