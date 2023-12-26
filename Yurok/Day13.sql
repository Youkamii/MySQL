없어진 기록 찾기
SELECT o.ANIMAL_ID, o.NAME
FROM ANIMAL_OUTS o
WHERE NOT EXISTS (
    SELECT *
    FROM ANIMAL_INS i
    WHERE i.ANIMAL_ID = o.ANIMAL_ID
)
ORDER BY o.ANIMAL_ID;

조건에 맞는 사용자 정보 조회하기
SELECT
    U.USER_ID,
    U.NICKNAME,
    CONCAT(U.CITY, ' ', U.STREET_ADDRESS1, ' ', U.STREET_ADDRESS2) AS 전체주소,
    CONCAT(SUBSTRING(U.TLNO, 1, 3), '-', SUBSTRING(U.TLNO, 4, 4), '-', SUBSTRING(U.TLNO, 8, 4)) AS 전화번호
FROM
    USED_GOODS_USER U
WHERE
        U.USER_ID IN (
        SELECT
            WRITER_ID
        FROM
            USED_GOODS_BOARD
        GROUP BY
            WRITER_ID
        HAVING
                COUNT(*) >= 3
        )
ORDER BY
    U.USER_ID DESC;

취소되지 않은 진료 예약 조회하기
SELECT
    A.APNT_NO,
    P.PT_NAME,
    P.PT_NO,
    A.MCDP_CD,
    D.DR_NAME,
    A.APNT_YMD
FROM
    APPOINTMENT A
        JOIN PATIENT P ON A.PT_NO = P.PT_NO
        JOIN DOCTOR D ON A.MDDR_ID = D.DR_ID
WHERE
        A.APNT_CNCL_YN != 'Y'
  AND A.MCDP_CD = 'CS'
  AND DATE(A.APNT_YMD) = '2022-04-13'
ORDER BY
    A.APNT_YMD ASC;

자동차 대여 기록에서 대여중 / 대여 가능 여부 구분하기
SELECT
    CAR_ID,
    MAX(CASE
            WHEN '2022-10-16' BETWEEN START_DATE AND END_DATE THEN '대여중'
            ELSE '대여 가능'
        END) AS AVAILABILITY
FROM
    CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY
    CAR_ID
ORDER BY
    CAR_ID DESC;