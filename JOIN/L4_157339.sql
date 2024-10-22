# 1번
SELECT C.CAR_ID, C.CAR_TYPE, ROUND(C.DAILY_FEE * 30 - C.DAILY_FEE * 30 * 0.01 * D.DISCOUNT_RATE) FEE
FROM CAR_RENTAL_COMPANY_CAR C JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN D ON C.CAR_TYPE = D.CAR_TYPE
WHERE C.CAR_ID NOT IN (SELECT DISTINCT CAR_ID
                       FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
                       WHERE DATE_FORMAT(START_DATE, '%Y-%m') <= '2022-11' AND DATE_FORMAT(END_DATE, '%Y-%m') >= '2022-11')
    AND C.CAR_TYPE IN ('SUV', '세단')
    AND D.DURATION_TYPE = '30일 이상'
    AND ROUND(C.DAILY_FEE * 30 - C.DAILY_FEE * 30 * 0.01 * D.DISCOUNT_RATE) BETWEEN 500000 AND 1999999
ORDER BY FEE DESC, CAR_TYPE, CAR_ID DESC

# 2번
SELECT C.CAR_ID, C.CAR_TYPE, ROUND(C.DAILY_FEE * (1 - D.DISCOUNT_RATE * 0.01) * 30, 0) AS FEE
FROM (CAR_RENTAL_COMPANY_CAR AS C JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY AS H ON C.CAR_ID = H.CAR_ID)
    JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN D ON C.CAR_TYPE = D.CAR_TYPE 
WHERE (C.CAR_TYPE IN ('세단', 'SUV')) AND 
      (C.CAR_ID) NOT IN (SELECT CAR_ID
                         FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                         WHERE ((DATE_FORMAT(START_DATE, '%Y-%m') <= '2022-11') 
                                    AND (DATE_FORMAT(END_DATE, '%Y-%m') >= '2022-11'))
                         GROUP BY CAR_ID) AND
      (D.DURATION_TYPE = '30일 이상') AND 
      (ROUND(C.DAILY_FEE * (1 - D.DISCOUNT_RATE * 0.01) * 30, 0) BETWEEN 500000 AND 1999999)
GROUP BY C.CAR_ID
ORDER BY FEE DESC, C.CAR_TYPE, C.CAR_ID DESC