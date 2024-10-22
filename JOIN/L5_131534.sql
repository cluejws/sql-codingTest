#1
SELECT DATE_FORMAT(S.SALES_DATE, '%Y') AS YEAR, 
    DATE_FORMAT(S.SALES_DATE,'%m') AS MONTH, 
       COUNT(DISTINCT U.USER_ID) AS PUCHASED_USERS,
       ROUND(
           COUNT(DISTINCT U.USER_ID)/(SELECT COUNT(DISTINCT UI.USER_ID) FROM USER_INFO AS UI WHERE DATE_FORMAT(UI.JOINED, '%Y') = '2021')
             , 1) AS PUCHASED_RATIO
       
FROM USER_INFO U JOIN ONLINE_SALE S ON (U.USER_ID = S.USER_ID)
WHERE DATE_FORMAT(U.JOINED, '%Y') = '2021'
GROUP BY DATE_FORMAT(S.SALES_DATE, '%Y'), DATE_FORMAT(S.SALES_DATE,'%m')
ORDER BY DATE_FORMAT(S.SALES_DATE, '%Y'), DATE_FORMAT(S.SALES_DATE,'%m')

#2 
WITH USER2021_INFO AS 
(SELECT COUNT(DISTINCT UI.USER_ID) AS COUNT
 FROM USER_INFO AS UI 
 WHERE YEAR(UI.JOINED) = '2021'
) 

SELECT YEAR(S.SALES_DATE) AS YEAR, MONTH(S.SALES_DATE) AS MONTH, 
    COUNT(DISTINCT S.USER_ID) AS PUCHASED_USERS,
    ROUND(
        (COUNT(DISTINCT S.USER_ID)) / (SELECT COUNT FROM USER2021_INFO) , 1) AS PUCHASED_RATIO
FROM USER_INFO U JOIN ONLINE_SALE S ON (U.USER_ID = S.USER_ID)
WHERE YEAR(U.JOINED) = '2021'
GROUP BY YEAR(S.SALES_DATE), MONTH(S.SALES_DATE)
ORDER BY YEAR(S.SALES_DATE), MONTH(S.SALES_DATE)