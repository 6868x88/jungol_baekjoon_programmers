/*
신규 TikTok 사용자는 이메일로 가입합니다. 계정 활성화를 위해 문자 확인에 답장하여 가입을 확인했습니다. 사용자는 새 계정을 확인할 때까지 계정 확인을 위한 여러 개의 문자 메시지를 받을 수 있습니다.
고위 분석가가 이메일 표에 있는 특정 사용자의 활성화율을 알고 싶어합니다. 활성화율을 찾기 위해 쿼리를 작성합니다. 백분율을 소수점 2자리로 반올림합니다.
*/

select round(count(aa.email_id)*1.00/count(bb.email_id)*1.00,2) as confirm_rate 
from (
  select b.email_id 
  from texts a 
  inner join emails b 
  on a.email_id = b.email_id 
  where a.signup_action = 'Confirmed'
  ) aa 
right join emails bb 
on aa.email_id = bb.email_id
;

