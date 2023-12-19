SELECT I.ANIMAL_ID, I.NAME
FROM ANIMAL_INS as I, ANIMAL_OUTS as O
WHERE I.ANIMAL_ID=O.ANIMAL_ID 
    and I.DATETIME>O.DATETIME
ORDER BY I.DATETIME
