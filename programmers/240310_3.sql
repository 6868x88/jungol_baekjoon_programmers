-- 부서별 평균 연봉을 조회하기
-- 부서별로 부서 ID, 영문 부서명, 평균 연봉을 조회하는 SQL문을 작성
-- 평균연봉은 소수점 첫째 자리에서 반올림하고 컬럼명은 AVG_SAL로 해주세요.
-- 결과는 부서별 평균 연봉을 기준으로 내림차순 정렬해주세요.

SELECT /*+ PARALLEL(A,8) FULL(A) */ 
       A.DEPT_ID
      ,A.DEPT_NAME_EN
      ,B.AVG_SAL
FROM HR_DEPARTMENT A,
        (SELECT 
                DEPT_ID, 
                ROUND(AVG(SAL),0) AS AVG_SAL
         FROM HR_EMPLOYEES
         GROUP BY DEPT_ID) B
WHERE A.DEPT_ID = B.DEPT_ID
ORDER BY B.AVG_SAL DESC;
