// 역순 정렬하기
SELECT NAME, DATETIME FROM ANIMAL_INS
ORDER BY ANIMAL_ID DESC;

// 상위 n개 레코드
SELECT NAME FROM ANIMAL_INS
ORDER BY DATETIME
LIMIT 1;

// 동명 동물 수 찾기
SELECT NAME, COUNT(NAME) AS COUNT
FROM ANIMAL_INS
GROUP BY NAME
HAVING COUNT(NAME) >= 2
ORDER BY NAME;

// 나이 정보가 없는 회원 수 구하기
SELECT COUNT(*) FROM USER_INFO AS USERS
WHERE AGE IS NULL;
