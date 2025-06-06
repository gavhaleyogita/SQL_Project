SELECT 
    Gender, Date as dt,
    MONTH(STR_TO_DATE(Date,'%d-%m-%Y')) AS Months, 
    SUM(Total) AS Monthly_Sales
FROM `walmartsales dataset - walmartsales`
GROUP BY Gender, Date 
ORDER BY Gender, Date;