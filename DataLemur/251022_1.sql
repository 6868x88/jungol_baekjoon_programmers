/*
Repeated Payments
*/

with timetb as(
SELECT  merchant_id
      , amount
      , transaction_timestamp
      , LAG(transaction_timestamp) over (partition by merchant_id, amount order by transaction_timestamp) as pre_timestamp
FROM transactions)

SELECT count(merchant_id) as payment_count
FROM timetb
where age(transaction_timestamp, pre_timestamp) <= INTERVAL '10 minutes'
