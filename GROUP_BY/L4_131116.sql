SELECT CATEGORY, PRICE AS MAX_PRICE, PRODUCT_NAME 
FROM FOOD_PRODUCT
WHERE (CATEGORY, PRICE) in (SELECT CATEGORY, MAX(PRICE) as MAX_PRICE
                            FROM FOOD_PRODUCT 
                            WHERE CATEGORY in ('과자', '국', '김치', '식용유') 
                            GROUP BY CATEGORY) 
ORDER BY PRICE DESC