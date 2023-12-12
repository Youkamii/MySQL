// 이름에 el이 드러가는 동물 찾기

SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE ANIMAL_TYPE = 'Dog' AND NAME LIKE '%EL%'
ORDER BY NAME

// 가장 비싼 상품 구하기

SELECT MAX(PRICE) AS MAX_PRICE
FROM PRODUCT

// NULL 처리하기

SELECT ANIMAL_TYPE, IFNULL(NAME, 'No name'), SEX_UPON_INTAKE
FROM ANIMAL_INS

// 강원도에 위치한 생상공장 목록 출력하기

SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
FROM FOOD_FACTORY
WHERE ADDRESS LIKE '강원도%'
ORDER BY FACTORY_ID