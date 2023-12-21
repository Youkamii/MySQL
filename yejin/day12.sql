-- 코드를 입력하세요
SELECT DISTINCT
    c1.CAR_ID
FROM
    CAR_RENTAL_COMPANY_CAR c1
        JOIN
    CAR_RENTAL_COMPANY_RENTAL_HISTORY c2
    ON c1.CAR_ID = c2.CAR_ID
WHERE
    CAR_TYPE = '세단'
  AND
    DATE_FORMAT(START_DATE, '%Y-%m') = '2022-10'
ORDER BY
    CAR_ID DESC


-- 코드를 입력하세요
SELECT
    f.CATEGORY,
    f.PRICE AS MAX_PRICE,
    PRODUCT_NAME
FROM
    FOOD_PRODUCT f JOIN
    (
        SELECT
            CATEGORY,
            MAX(PRICE) AS PRICE
        FROM
            FOOD_PRODUCT
        WHERE
            CATEGORY IN ('과자', '국', '김치', '식용유')
        GROUP BY
            CATEGORY
    ) f2
    ON f.PRICE = f2.PRICE
        AND f.CATEGORY = f2.CATEGORY
ORDER BY
    MAX_PRICE DESC


-- 코드를 입력하세요
SELECT
    r.FOOD_TYPE,
    REST_ID,
    REST_NAME,
    r.FAVORITES
FROM
    REST_INFO r JOIN
    (
        SELECT
            FOOD_TYPE,
            MAX(FAVORITES) AS FAVORITES
        FROM
            REST_INFO
        GROUP BY
            FOOD_TYPE
    ) f
    ON r.FOOD_TYPE = f.FOOD_TYPE
        AND r.FAVORITES = f.FAVORITES
ORDER BY
    FOOD_TYPE DESC


-- 코드를 입력하세요
SELECT
    a.PRODUCT_ID,
    PRODUCT_NAME,
    PRICE * AMOUNT AS TOTAL_SALES
FROM
    (
        SELECT
            PRODUCT_ID,
            PRODUCT_NAME,
            PRICE
        FROM
            FOOD_PRODUCT
    ) a JOIN
    (
        SELECT
            PRODUCT_ID,
            SUM(AMOUNT) AS AMOUNT
        FROM
            FOOD_ORDER
        WHERE
            DATE_FORMAT(PRODUCE_DATE, '%Y-%m') = '2022-05'
        GROUP BY
            PRODUCT_ID
    ) b
    ON a.PRODUCT_ID = b.PRODUCT_ID
ORDER BY
    TOTAL_SALES DESC,
    PRODUCT_ID