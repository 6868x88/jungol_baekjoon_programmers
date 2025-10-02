/*
2022년 8월에 Microsoft Teams에서 가장 많은 메시지를 보낸 상위 2명의 파워 유저를 식별하기 위한 쿼리를 작성합니다. 이 두 사용자의 ID와 총 메시지 수를 표시합니다. 메시지 수에 따라 결과를 내림차순으로 출력합니다.
*/

select sender_id
	     ,count(message_id) as message_count
from messages
where extract (month from sent_date) = 8 and extract (year from sent_date) =2022
group by sender_id
order by message_count DESC
limit 2
;
