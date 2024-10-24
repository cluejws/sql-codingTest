WITH A_TABLE AS (
    SELECT ID
    FROM DEVELOPERS D
        JOIN SKILLCODES SA ON (D.SKILL_CODE & SA.CODE = SA.CODE AND SA.CATEGORY = 'Front End')
        JOIN SKILLCODES SB ON (D.SKILL_CODE & SB.CODE = SB.CODE AND SB.NAME = 'Python') 
), B_TABLE AS (
    SELECT ID
    FROM DEVELOPERS D
        JOIN SKILLCODES SA ON (D.SKILL_CODE & SA.CODE = SA.CODE AND SA.NAME = 'C#') 
), C_TABLE AS (
    SELECT ID
    FROM DEVELOPERS D
        JOIN SKILLCODES SA ON (D.SKILL_CODE & SA.CODE = SA.CODE AND SA.CATEGORY = 'Front End')
)

SELECT TB.GRADE, TB.ID, TB.EMAIL
FROM (
    SELECT 
        CASE 
            WHEN ID IN (SELECT ID FROM A_TABLE) THEN 'A'
            WHEN ID IN (SELECT ID FROM B_TABLE) THEN 'B'
            WHEN ID IN (SELECT ID FROM C_TABLE) THEN 'C'
            ELSE NULL
        END AS 'GRADE', ID, EMAIL
    FROM DEVELOPERS
) TB
WHERE TB.GRADE IS NOT NULL
ORDER BY TB.GRADE ASC, TB.ID ASC;