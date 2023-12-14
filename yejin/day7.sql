-- 코드를 입력하세요
SELECT
    ANIMAL_ID
FROM
    ANIMAL_INS
WHERE
    NAME IS NULL
ORDER BY
    ANIMAL_ID


-- 코드를 입력하세요
SELECT
    count(USER_ID) AS 'USERS'
FROM
    USER_INFO
WHERE
        AGE >= 20 AND AGE <= 29
  AND
        LEFT(JOINED,4) = '2021'


-- 코드를 입력하세요
SELECT
    LEFT(PRODUCT_CODE, 2) AS 'CATEGORY',
    COUNT(PRODUCT_ID) AS 'PRODUCTS'
FROM
    PRODUCT
GROUP BY
    LEFT(PRODUCT_CODE, 2)
ORDER BY
    CATEGORY


-- 코드를 입력하세요
SELECT
    ANIMAL_ID,
    NAME,
    (
        CASE
            WHEN SEX_UPON_INTAKE LIKE 'Neutered%' THEN 'O'
            WHEN SEX_UPON_INTAKE LIKE 'Spayed%' THEN 'O'
            ELSE 'X'
            END
        ) AS '중성화'
FROM
    ANIMAL_INS