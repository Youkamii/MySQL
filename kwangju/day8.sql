// 고양이와 개는 몇 마리 있을까

SELECT
    ANIMAL_TYPE,
    COUNT(*) AS count
FROM
    ANIMAL_INS
GROUP BY
    ANIMAL_TYPE
HAVING
    ANIMAL_TYPE IN ('Cat', 'Dog')
ORDER BY
    ANIMAL_TYPE


// 진료과별 총 예약 횟수 출력하기

SELECT
    MCDP_CD AS 진료과코드,
    COUNT(*) AS 5월예약건수
FROM
    APPOINTMENT
WHERE
        APNT_YMD LIKE '2022-05%'
GROUP BY
    MCDP_CD
ORDER BY
    5월예약건수, MCDP_CD


// 입양 시각 구하기(1)

SELECT
    CAST(SUBSTRING(DATETIME, 12, 2) AS DECIMAL) AS HOUR,
    COUNT(*) AS COUNT
FROM
    ANIMAL_OUTS
GROUP BY
    HOUR
HAVING
    HOUR >= 9
   AND
    HOUR <= 19
ORDER BY
    HOUR

// 12세 이하인 여자 환자 목록 출력하기

SELECT
    PT_NAME,
    PT_NO,
    GEND_CD,
    AGE,
    IFNULL(TLNO, 'NONE') AS TLNO
FROM
    PATIENT
WHERE
        AGE <= 12
  AND
        GEND_CD = 'W'
ORDER BY
    AGE DESC,
    PT_NAME