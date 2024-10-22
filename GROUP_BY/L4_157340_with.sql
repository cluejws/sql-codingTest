WITH CAN_RENTAL AS 
(
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
    WHERE CAR_ID NOT IN (SELECT CAR_ID
                    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                    WHERE DATE_FORMAT(START_DATE, '%Y-%m-%d') <= '2022-10-16'
                        AND DATE_FORMAT(END_DATE, '%Y-%m-%d') >= '2022-10-16')
    GROUP BY CAR_ID 
)

SELECT H.CAR_ID, 
    CASE 
        WHEN CR.CAR_ID IS NULL THEN '대여중'
        ELSE '대여 가능'
    END AS AVAILABILITY
FROM CAN_RENTAL CR RIGHT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY H ON (CR.CAR_ID = H.CAR_ID)
GROUP BY CAR_ID
ORDER BY CAR_ID DESC