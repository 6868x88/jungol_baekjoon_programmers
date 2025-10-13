/*
User Shopping Sprees
쇼핑을 이틀 이상 연속으로 구매한 사람 구하
*/

SELECT DISTINCT a.user_id
FROM transactions a
JOIN transactions b
on DATE(a.transaction_date)+1 = DATE(b.transaction_date)
ORDER BY a.user_id
;
