-- 코드를 입력하세요
SELECT
    YEAR(SALES_DATE) AS YEAR,
    MONTH(SALES_DATE) AS MONTH,
    GENDER,
    COUNT(DISTINCT o.USER_ID) AS USERS
FROM
    ONLINE_SALE o JOIN
    USER_INFO u
ON o.USER_ID = u.USER_ID
WHERE
    GENDER IS NOT NULL
GROUP BY
    YEAR,
    MONTH,
    GENDER
ORDER BY
    YEAR,
    MONTH,
    GENDER


-- 코드를 입력하세요
SELECT
    ri.REST_ID,
    REST_NAME,
    FOOD_TYPE,
    FAVORITES,
    ADDRESS,
    ROUND(AVG(REVIEW_SCORE), 2) AS SCORE
FROM
    REST_INFO ri JOIN
    REST_REVIEW rr
    ON ri.REST_ID = rr.REST_ID
WHERE
    LEFT(ADDRESS, 2) = '서울'
GROUP BY
    ri.REST_ID
ORDER BY
    SCORE DESC,
    FAVORITES DESC


-- 코드를 입력하세요
SELECT
    *
FROM
    PLACES
WHERE
    HOST_ID IN
    (
        SELECT
            HOST_ID
        FROM
            PLACES
        GROUP BY
            HOST_ID
        HAVING COUNT(ID) >= 2
    )
ORDER BY
    ID


-- 코드를 입력하세요
SELECT
    DISTINCT CART_ID
FROM
    CART_PRODUCTS
WHERE
    CART_ID IN
    (
        SELECT
            CART_ID
        FROM
            CART_PRODUCTS
        WHERE
            NAME = 'Milk'
    ) AND
    CART_ID IN
    (
        SELECT
            CART_ID
        FROM
            CART_PRODUCTS
        WHERE
            NAME = 'Yogurt'
    )
ORDER BY
    CART_ID