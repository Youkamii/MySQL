// 인기있는 아이스크림

SELECT
    FLAVOR
FROM
    FIRST_HALF
ORDER BY
    TOTAL_ORDER DESC,
    SHIPMENT_ID


// 자도차 종류 별 특정 옵션이 포함된 자동차 수 구하기

SELECT
    CAR_TYPE,
    COUNT(*) AS CARS
FROM
    CAR_RENTAL_COMPANY_CAR
WHERE
        OPTIONS LIKE '%통풍시트%'
   OR
        OPTIONS LIKE '%열선시트%'
   OR
        OPTIONS LIKE '%가죽시트%'
GROUP BY
    CAR_TYPE
ORDER BY
    CAR_TYPE


// 카테고리 별 도서 판매량 집계하기

SELECT
    CATEGORY,
    SUM(SALES) AS TOTAL_SALES
FROM
    BOOK B,
    BOOK_SALES BS
WHERE
        B.BOOK_ID = BS.BOOK_ID
  AND
    LEFT(BS.SALES_DATE,7) = '2022-01'
GROUP BY
    CATEGORY
ORDER BY
    CATEGORY


// 오랜 기간 보호한 동물(1)

SELECT
    NAME,
    DATETIME
FROM
    ANIMAL_INS AI
WHERE
        AI.ANIMAL_ID NOT IN
        (
            SELECT
                ANIMAL_ID
            FROM
                ANIMAL_OUTS
        )
ORDER BY
    DATETIME
    LIMIT
    3