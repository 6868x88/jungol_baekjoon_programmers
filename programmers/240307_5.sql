
-- 노선별 평균 역 사이 거리 조회하기
-- 노선별로 노선, TOTAL_DISTANCE 총 누계 거리(역 사이 거리의 총 합), AVERAGE_DISTANCE 평균 역 사이 거리를 노선별로 조회하는 SQL문을 작성
-- 총 누계거리는 소수 둘째자리에서, 평균 역 사이 거리는 소수 셋째 자리에서 반올림 한 뒤 단위(km)를 함께 출력해주세요.
-- 총 누계 거리를 기준으로 내림차순 정렬

--1.MySQL
SELECT ROUTE
      ,CONCAT(ROUND(SUM(D_BETWEEN_DIST), 1),"km")  AS TOTAL_DISTANCE
      ,CONCAT(ROUND(SUM(D_BETWEEN_DIST)/COUNT(ROUTE), 2),"km") AS AVERAGE_DISTANCE
    FROM SUBWAY_DISTANCE 
    GROUP BY ROUTE
    ORDER BY ROUND(SUM(D_BETWEEN_DIST),2) DESC
    ;

--2.Oracle 
SELECT ROUTE
      ,ROUND(SUM(D_BETWEEN_DIST), 1) || 'km'  AS TOTAL_DISTANCE
      ,ROUND(SUM(D_BETWEEN_DIST)/COUNT(ROUTE), 2) || 'km' AS AVERAGE_DISTANCE
    FROM SUBWAY_DISTANCE 
    GROUP BY ROUTE
    ORDER BY ROUND(SUM(D_BETWEEN_DIST),2) DESC
    ;
