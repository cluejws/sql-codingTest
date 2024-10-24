WITH RECURSIVE HOUR_TABLE AS(
    SELECT 0 AS 'HOUR'

    UNION ALL
    
    SELECT (HOUR+1)
    FROM HOUR_TABLE
    WHERE HOUR < 23
)

SELECT B.HOUR AS 'HOUR', 
    CASE 
        WHEN DATE_FORMAT(A.DATETIME, '%H') IS NOT NULL THEN COUNT(*)
        ELSE 0
    END AS COUNT
FROM ANIMAL_OUTS A RIGHT OUTER JOIN HOUR_TABLE B ON DATE_FORMAT(A.DATETIME, '%H') = B.HOUR
GROUP BY B.HOUR
ORDER BY B.HOUR ASC;