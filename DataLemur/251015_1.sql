/*
Card Launch Success
신용카드 첫 출시 달의 발급양 출력 
*/


with crd as
  (select card_name
      , issued_amount
      , row_number () over (PARTITION BY card_name order by issue_year, issue_month) as rn
   from monthly_cards_issued)
select card_name, issued_amount
from crd
where rn = 1
order by issued_amount desc
;
