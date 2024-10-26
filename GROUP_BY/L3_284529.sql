SELECT D.DEPT_ID AS DEPT_ID, 
    D.DEPT_NAME_EN AS DEPT_NAME_EN,
    ROUND(AVG(SAL), 0) AS AVG_SAL
FROM HR_DEPARTMENT D JOIN HR_EMPLOYEES E ON (D.DEPT_ID = E.DEPT_ID)
GROUP BY D.DEPT_ID
ORDER BY AVG_SAL DESC;