-- 코드를 입력하세요
SELECT
    ANIMAL_ID,
    NAME
FROM
    ANIMAL_OUTS
WHERE
    ANIMAL_ID NOT IN
    (
        SELECT
            ANIMAL_ID
        FROM
            ANIMAL_INS
    )
ORDER BY
    ANIMAL_ID


-- 코드를 입력하세요
SELECT
    USER_ID,
    NICKNAME,
    CONCAT(CITY, ' ', STREET_ADDRESS1, ' ', STREET_ADDRESS2) AS '전체주소',
        CONCAT(SUBSTRING(TLNO, 1, 3), '-', SUBSTRING(TLNO, 4, 4), '-', SUBSTRING(TLNO, 8, 4)) AS '전화번호'
FROM
    USED_GOODS_USER
WHERE
    USER_ID IN
    (
        SELECT
            WRITER_ID AS USER_ID
        FROM
            USED_GOODS_BOARD
        GROUP BY
            WRITER_ID
        HAVING
            COUNT(BOARD_ID) >= 3
    )
ORDER BY
    USER_ID DESC


-- 코드를 입력하세요
WITH TB_P AS (
    SELECT
        PT_NO,
        PT_NAME
    FROM
        PATIENT
), TB_D AS (
    SELECT
        DR_ID,
        DR_NAME
    FROM
        DOCTOR
), TB_A AS (
    SELECT
        APNT_YMD,
        APNT_NO,
        PT_NO,
        MCDP_CD,
        MDDR_ID
    FROM
        APPOINTMENT
    WHERE
        DATE_FORMAT(APNT_YMD, '%Y-%m-%d') = '2022-04-13'
        AND
        MCDP_CD = 'CS'
        AND
        APNT_CNCL_YN = 'N'
)
SELECT
    APNT_NO,
    PT_NAME,
    TB_P.PT_NO,
    MCDP_CD,
    DR_NAME,
    APNT_YMD
FROM
    TB_A
    JOIN TB_D
        ON TB_A.MDDR_ID = TB_D.DR_ID
    JOIN TB_P
        ON TB_A.PT_NO = TB_P.PT_NO
ORDER BY
    APNT_YMD


-- 코드를 입력하세요
    WITH a AS (
    SELECT
        DISTINCT CAR_ID
    FROM
        CAR_RENTAL_COMPANY_RENTAL_HISTORY c1
    WHERE
        START_DATE <= '2022-10-16'
        AND
        END_DATE >= '2022-10-16'
)
SELECT
    DISTINCT c.CAR_ID,
             CASE
                 WHEN a.CAR_ID IS NULL THEN '대여 가능'
                 ELSE '대여중'
                 END AS AVAILABILITY
FROM
    CAR_RENTAL_COMPANY_RENTAL_HISTORY c
        LEFT OUTER JOIN
    a
    ON c.CAR_ID = a.CAR_ID
ORDER BY
    c.CAR_ID DESC
