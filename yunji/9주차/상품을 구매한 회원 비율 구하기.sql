SELECT YEAR(SALES_DATE) YEAR, MONTH(SALES_DATE) MONTH, 
COUNT(DISTINCT u.USER_ID) PUCHASED_USERS,
ROUND(COUNT(DISTINCT u.USER_ID)/
    (SELECT COUNT(1) FROM USER_INFO WHERE YEAR(JOINED) = '2021'), 1) PUCHASED_RATIO
FROM ONLINE_SALE o LEFT JOIN USER_INFO u ON o.USER_ID=u.USER_ID
WHERE YEAR(JOINED) = '2021'
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH