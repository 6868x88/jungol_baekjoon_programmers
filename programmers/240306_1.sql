-- 조건에 맞는 사원 정보 조회 하기 


SELECT
    B.SCORE
    ,A.EMP_NO
    ,A.EMP_NAME
    ,A.POSITION
    ,A.EMAIL
FROM HR_EMPLOYEES A
    ,(SELECT EMP_NO
            ,SUM(SCORE) AS SCORE
      FROM HR_GRADE
      WHERE YEAR = '2022'
      GROUP BY EMP_NO
      ORDER BY SCORE DESC)B
WHERE A.EMP_NO = B.EMP_NO
LIMIT 1; -- MySQL에서는 LIMIT 썼지만, 오라클에서는 where 절에 rownum=1 써서 풀기 가능
