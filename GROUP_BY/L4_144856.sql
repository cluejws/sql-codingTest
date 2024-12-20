# O
SELECT B.AUTHOR_ID, A.AUTHOR_NAME, B.CATEGORY, SUM(S.SALES * B.PRICE) AS TOTAL_SALES 
FROM (BOOK B JOIN AUTHOR A ON B.AUTHOR_ID = A.AUTHOR_ID) JOIN BOOK_SALES S ON B.BOOK_ID = S.BOOK_ID
WHERE DATE_FORMAT(S.SALES_DATE, '%Y-%m') = '2022-01'
GROUP BY B.AUTHOR_ID, B.CATEGORY
ORDER BY B.AUTHOR_ID ASC, B.CATEGORY DESC

# X -> 같은 저자 / (가격 다른 책) 
# 3개 -> 홍길동 1번 1000원 
# 2개 -> 홍길동 2번 2000원
-> 가격 설정 불가
SELECT B.AUTHOR_ID, A.AUTHOR_NAME, B.CATEGORY, SUM(S.SALES) * B.PRICE AS TOTAL_SALES 
FROM (BOOK B JOIN AUTHOR A ON B.AUTHOR_ID = A.AUTHOR_ID) JOIN BOOK_SALES S ON B.BOOK_ID = S.BOOK_ID
WHERE DATE_FORMAT(S.SALES_DATE, '%Y-%m') = '2022-01'
GROUP BY B.AUTHOR_ID, B.CATEGORY
ORDER BY B.AUTHOR_ID ASC, B.CATEGORY DESC