/*
Histogram of Users and Purchases
최근 날짜 구매 횟수 구하기
*/


SELECT a.transaction_date
      , a.user_id
      , count(a.user_id) as purchase_count
FROM
  (SELECT user_id
  	, transaction_date
	  , dense_rank () over (partition by user_id order by transaction_date DESC) as rn
  FROM user_transactions) a
WHERE a.rn = 1
GROUP BY a.user_id, a.transaction_date
ORDER BY a.transaction_date
;
