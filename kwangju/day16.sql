// 그룹별 조건에 맞는 식당 목록 출력하기

WITH m AS (
    SELECT
        MEMBER_ID,
        MEMBER_NAME
    FROM
        MEMBER_PROFILE
), r AS (
    SELECT
        MEMBER_ID,
        COUNT(REVIEW_ID) AS TOTAL_REVIEW
    FROM
        REST_REVIEW
    GROUP BY
        MEMBER_ID
)

SELECT
    MEMBER_NAME,
    REVIEW_TEXT,
    DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM
    m JOIN r
           ON m.MEMBER_ID = r.MEMBER_ID
      JOIN
    REST_REVIEW rr
    ON r.MEMBER_ID = rr.MEMBER_ID
WHERE
        TOTAL_REVIEW =
        (
            SELECT
                MAX(TOTAL_REVIEW)
            FROM
                r
        )
ORDER BY
    REVIEW_DATE,
    REVIEW_TEXT


// 오프라인/온라인 판매 데이터 통합하기

WITH TB AS (
    SELECT
        SALES_DATE,
        PRODUCT_ID,
        NULL AS USER_ID,
        SALES_AMOUNT
    FROM
        OFFLINE_SALE
    WHERE
        DATE_FORMAT(SALES_DATE, '%Y-%m') = '2022-03'
    UNION ALL
    SELECT
        SALES_DATE,
        PRODUCT_ID,
        USER_ID,
        SALES_AMOUNT
    FROM
        ONLINE_SALE
    WHERE
        DATE_FORMAT(SALES_DATE, '%Y-%m') = '2022-03'
)

SELECT
    DATE_FORMAT(SALES_DATE, '%Y-%m-%d') AS SALES_DATE,
    PRODUCT_ID,
    USER_ID,
    SALES_AMOUNT
FROM
    TB
ORDER BY
    SALES_DATE,
    PRODUCT_ID,
    USER_ID


//조건에 부합하는 중고거래 댓글 조회하기

SELECT
    TITLE,
    u1.BOARD_ID,
    REPLY_ID,
    u2.WRITER_ID,
    u2.CONTENTS,
    DATE_FORMAT(u2.CREATED_DATE, '%Y-%m-%d') AS CREATED_DATE
FROM
    (
        SELECT
            BOARD_ID, TITLE
        FROM
            USED_GOODS_BOARD
        WHERE
                CREATED_DATE >= '2022-10-01'
          AND
                CREATED_DATE < '2022-11-01'
    ) u1
        JOIN
    USED_GOODS_REPLY u2
    ON u1.BOARD_ID = u2.BOARD_ID
ORDER BY
    CREATED_DATE,
    TITLE


// 입양 시각 구하기(2)

SET @HOUR = -1;
SELECT
    (@HOUR := @HOUR+1) AS HOUR,
    (
        SELECT
            COUNT(*)
        FROM
            ANIMAL_OUTS
        WHERE
            HOUR(DATETIME) = @HOUR
    ) COUNT
FROM
    ANIMAL_OUTS
WHERE
    @HOUR < 23;