/*
멸종위기의 대장균 찾기

계층쿼리(start with~ connect by 문)은 오라클만 가능
mysql은 재귀쿼리 사용*/

-- 코드를 작성해주세요
with recursive tree as(
    -- 부모 노드
    select ID
          , PARENT_ID
          , 1 as GENERATION
    from ECOLI_DATA
    where PARENT_ID is null
    
    union all
    
    -- 자식 노드
    select d.ID
          , d.PARENT_ID
          , t.GENERATION + 1
    from ECOLI_DATA d
    join tree t on d.PARENT_ID = t.ID
), leaf as( 
    -- 자식 노드 없는 부모 노드
    select p.ID
    from ECOLI_DATA p
    where not exists (
                        select 1
                        from ECOLI_DATA c
                        where c.PARENT_ID = p.id)
)
select count(*) as count
        , tt.GENERATION
from tree tt
join leaf l
on tt.ID = l.ID
group by tt.GENERATION
order by tt.GENERATION
