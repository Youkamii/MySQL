-- 코드를 입력하세요
SELECT
    CONCAT('/home/grep/src/', u.BOARD_ID, '/', FILE_ID, FILE_NAME, FILE_EXT) AS FILE_PATH
FROM
    USED_GOODS_FILE u
        JOIN
    (
        SELECT
            BOARD_ID,
            VIEWS
        FROM
            USED_GOODS_BOARD
    ) b
    ON u.BOARD_ID = b.BOARD_ID
WHERE
    VIEWS IN
    (
        SELECT
            MAX(VIEWS)
        FROM
            USED_GOODS_BOARD
    )
ORDER BY
    FILE_ID DESC


-- 코드를 입력하세요
    WITH s AS (
    SELECT
        BOOK_ID,
        SUM(SALES) AS SALES
    FROM
        BOOK_SALES
    WHERE
        LEFT(SALES_DATE,7) = '2022-01'
    GROUP BY
        BOOK_ID
)

SELECT
    a.AUTHOR_ID,
    AUTHOR_NAME,
    CATEGORY,
    SUM(SALES * PRICE) AS TOTAL_SALES
FROM
    BOOK b
        JOIN AUTHOR a
             ON b.AUTHOR_ID = a.AUTHOR_ID
        JOIN s
             ON b.BOOK_ID = s.BOOK_ID
GROUP BY
    a.AUTHOR_ID,
    CATEGORY
ORDER BY
    a.AUTHOR_ID,
    CATEGORY DESC


-- 코드를 입력하세요
    WITH TB AS (
    SELECT
        FLAVOR,
        TOTAL_ORDER
    FROM
        FIRST_HALF
    UNION ALL
    SELECT
        FLAVOR,
        TOTAL_ORDER
    FROM
        JULY
)

SELECT
    FLAVOR
FROM
    TB
GROUP BY
    FLAVOR
ORDER BY
    SUM(TOTAL_ORDER) DESC
    LIMIT 3


-- 코드를 입력하세요
SELECT
    MONTH(START_DATE) AS MONTH,
    CAR_ID,
    COUNT(HISTORY_ID) AS RECORDS
FROM
    CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE
    MONTH(START_DATE) IN (8, 9, 10)
  AND
    CAR_ID IN
    (
        SELECT
            CAR_ID
        FROM
            CAR_RENTAL_COMPANY_RENTAL_HISTORY
        WHERE
            MONTH(START_DATE) IN (8, 9, 10)
        GROUP BY
            CAR_ID
        HAVING
            COUNT(HISTORY_ID) >= 5
    )
GROUP BY
    MONTH,
    CAR_ID
ORDER BY
    MONTH,
    CAR_ID DESC


