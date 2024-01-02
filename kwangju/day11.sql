// 성분으로 구분한 아이스크림 총 주문량

SELECT
    INGREDIENT_TYPE,
    SUM(TOTAL_ORDER) AS TOTAL_ORDER
FROM
    ICECREAM_INFO i INNER JOIN
    FIRST_HALF j
    ON i.FLAVOR = j.FLAVOR
GROUP BY
    INGREDIENT_TYPE
ORDER BY
    TOTAL_ORDER


// 루시와 엘라 찾기

SELECT
    ANIMAL_ID,
    NAME,
    SEX_UPON_INTAKE
FROM
    ANIMAL_INS
WHERE
        NAME IN ('Lucy', 'Ella', 'Pickle', 'Rogan', 'Sabrina', 'Mitty')
ORDER BY
    ANIMAL_ID


// 조건별로 분류하여 주문상태 출력하기

SELECT
    ORDER_ID,
    PRODUCT_ID,
    DATE_FORMAT(OUT_DATE, '%Y-%m-%d') AS OUT_DATE,
    CASE
        WHEN OUT_DATE <= '2022-05-01' THEN '출고완료'
        WHEN OUT_DATE > '2022-05-01' THEN '출고대기'
        ELSE '출고미정'
        END AS '출고여부'
FROM
    FOOD_ORDER
ORDER BY
    ORDER_ID


// 조건에 맞는 사용자와 총 거래금액 조회하기

SELECT
    USER_ID,
    NICKNAME,
    SUM(PRICE) AS TOTAL_SALES
FROM
    USED_GOODS_BOARD b INNER JOIN
    USED_GOODS_USER u
    ON b.WRITER_ID = u.USER_ID
WHERE
        b.STATUS = 'DONE'
GROUP BY
    USER_ID
HAVING
        TOTAL_SALES >= 700000
ORDER BY
    TOTAL_SALES
