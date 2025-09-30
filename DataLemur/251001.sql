/*사용자 ID, 노래 ID, 그리고 2022년 8월 4일까지의 노래 재생 누적 횟수를 내림차순으로 정렬하여 출력하는 쿼리를 작성하세요.*/

select a.user_id, a.song_id, sum(song_plays) as song_count
from
(select user_id, song_id, song_plays
from songs_history 
UNION ALL
select user_id, song_id, count(song_id) as song_plays
from songs_weekly
where EXTRACT(day from listen_time) < 5
group by user_id, song_id
) a 
group by a.user_id, a.song_id
order by sum(song_plays) DESC
;
