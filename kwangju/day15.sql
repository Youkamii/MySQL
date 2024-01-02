// 조회수가 가장 많은 중고거래 게시판의 첩부파일 조회하기

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


// 저자 별 카테고리 별 매출액 집계하기

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


// 주문량이 많은 아이스크림들 조회하기

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


// 대여 횟수가 많은 자동차들의 월별 대여 횟수 구하기

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

