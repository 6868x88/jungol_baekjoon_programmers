/*
FAANG Stock Min-Max (Part 1)
각 FAANG 주식에 대해 최고 및 최저 미결제 약정 가격(예시 출력 형식 참조)과 함께 티커 심볼, 월 및 연도('월-연월')를 표시합니다. 결과가 티커 심볼별로 정렬되었는지 확인합니다.
*/

WITH high_prices as (
SELECT ticker, 
       open, 
       to_char(date, 'Mon-YYYY') as highest_mth,
       row_number () OVER  (PARTITION BY ticker ORDER BY open desc) as rn
FROM stock_prices
),
low_prices as (
SELECT ticker, 
       open, 
       to_char(date, 'Mon-YYYY') as lowest_mth,
       row_number () OVER  (PARTITION BY ticker ORDER BY open) as rn
FROM stock_prices
)
SELECT h.ticker, h.highest_mth, h.open, l.lowest_mth, l.open
FROM high_prices h
inner JOIN low_prices l
ON h.ticker = l.ticker
WHERE h.rn = 1
  and l.rn = 1
;
