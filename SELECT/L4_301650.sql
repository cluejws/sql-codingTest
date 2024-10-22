# 1. WITH 절
WITH FIRST_TABLE AS (
    SELECT ID
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL
)

SELECT A.ID AS 'ID'
FROM ECOLI_DATA A
WHERE A.PARENT_ID IN (
    SELECT B.ID
    FROM ECOLI_DATA B
    WHERE B.PARENT_ID IN (
        SELECT C.ID
        FROM FIRST_TABLE C
    )
)
ORDER BY A.ID;

# 2. JOIN 절
SELECT A.ID AS 'ID'
FROM ECOLI_DATA A
JOIN ECOLI_DATA B ON (A.PARENT_ID = B.ID)
JOIN ECOLI_DATA C ON (B.PARENT_ID = C.ID) 
WHERE C.PARENT_ID IS NULL
ORDER BY A.ID;