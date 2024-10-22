# O
SELECT P.PRODUCT_ID AS PRODUCT_ID, P.PRODUCT_NAME AS PRODUCT_NAME, SUM(P.PRICE * O.AMOUNT) AS TOTAL_SALES
FROM FOOD_PRODUCT P JOIN FOOD_ORDER O ON (P.PRODUCT_ID = O.PRODUCT_ID)
WHERE DATE_FORMAT(O.PRODUCE_DATE, '%Y-%m') = '2022-05'
GROUP BY P.PRODUCT_ID
ORDER BY TOTAL_SALES DESC, P.PRODUCT_ID

# X
SELECT P.PRODUCT_ID AS PRODUCT_ID, P.PRODUCT_NAME AS PRODUCT_NAME, SUM(P.PRICE * O.AMOUNT) AS TOTAL_SALES
FROM FOOD_PRODUCT P JOIN FOOD_ORDER O ON (P.PRODUCT_ID = O.PRODUCT_ID)
GROUP BY P.PRODUCT_ID
HAVING DATE_FORMAT(O.PRODUCE_DATE, '%Y-%m') = '2022-05'
ORDER BY TOTAL_SALES DESC, P.PRODUCT_ID