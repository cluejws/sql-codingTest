WITH HEAVYUSER AS 
(
    SELECT HOST_ID
    FROM PLACES
    GROUP BY HOST_ID
    HAVING COUNT(ID) >= 2
) 

SELECT ID, NAME, HOST_ID
FROM PLACES
WHERE (HOST_ID) IN (SELECT HOST_ID
                   FROM HEAVYUSER)
ORDER BY ID