// 경기도에 위치한 식품창고 목록 출력하기
SELECT 
    WAREHOUSE_ID, 
    WAREHOUSE_NAME, 
    ADDRESS,
    CASE
        WHEN FREEZER_YN IS NULL THEN 'N'
        ELSE FREEZER_YN
    END FREEZER_YN
FROM FOOD_WAREHOUSE
WHERE ADDRESS LIKE '%경기%'
ORDER BY WAREHOUSE_ID ASC;

// DATETIME에서 DATE로 형 변환
SELECT 
    ANIMAL_ID,
    NAME, 
    DATE_FORMAT(DATETIME, '%Y-%m-%d') AS 날짜
/*
    DATE(DATETIME) AS 날짜
*/
FROM
    ANIMAL_INS

// 흉부외과 또는 일반외과 의사 목록 출력하기
SELECT 
    DR_NAME,
    DR_ID,
    MCDP_CD,
    DATE_FORMAT(HIRE_YMD, '%Y-%m-%d') AS HIRE_YMD
FROM
    DOCTOR
WHERE
    MCDP_CD = 'CS' OR 
    MCDP_CD = 'GS'
ORDER BY 
    HIRE_YMD DESC, DR_NAME ASC;


// 가격이 제일 비싼 식품의 정보 출력하기
