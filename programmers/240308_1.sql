-- 즐겨찾기가 가장 많은 식당 정보 출력하기

-- 음식종류별로 즐겨찾기수가 가장 많은 식당의 음식 종류, ID, 식당 이름, 즐겨찾기수를 조회하는 SQL문
-- 음식 종류를 기준으로 내림차순

--1.oracle
SELECT /*+ PARALLEL(A,8) FULL(A) */ 
      A.FOOD_TYPE
      ,A.REST_ID
      ,A.REST_NAME
      ,A.FAVORITES
FROM REST_INFO A,
    (SELECT FOOD_TYPE, MAX(FAVORITES) AS FAVORITES FROM REST_INFO GROUP BY FOOD_TYPE) B
WHERE A.FAVORITES = B.FAVORITES
AND A.FOOD_TYPE = B.FOOD_TYPE
ORDER BY A.FOOD_TYPE DESC;
