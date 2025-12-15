/*
608. Tree Node
*/

-- 계층형 쿼리 연습용, 성능 오버헤드 발생
with leafTb as(
    select id
    from Tree
    where CONNECT_BY_ISLEAF = 1
    start with P_ID is null
    connect by prior id = p_id
)
select
    id
    , case when P_ID is null then 'Root'
           when id in (select id from leafTb) then 'Leaf'
           else 'Inner' end as "type"
from Tree
;


-- 더 간단한 방식
select id,case when p_id is null then 'Root'
when id in(select p_id from tree) then 'Inner' else 'Leaf' end as type
from tree;
