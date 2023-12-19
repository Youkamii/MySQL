SELECT B.BOOK_ID, A.AUTHOR_NAME, DATE_FORMAT(B.PUBLISHED_DATE, "%Y-%m-%d") as PUBLISHED_DATE
FROM BOOK as B, AUTHOR as A
WHERE B.CATEGORY like "경제" AND B.AUTHOR_ID=A.AUTHOR_ID
ORDER BY PUBLISHED_DATE 
