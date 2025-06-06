WITH ProductStats AS (
    SELECT 
        `Product line`,
        AVG(Total) AS Avg_Sales, 
        STDDEV(Total) AS Std_Sales
    FROM `walmartsales dataset - walmartsales`
    GROUP BY `Product line`
),
SalesWithZScore AS (
    SELECT 
        w.`Invoice ID`, 
        w.`Product line`, 
        w.Total, 
        p.Avg_Sales, 
        p.Std_Sales,
        (w.Total - p.Avg_Sales) / p.Std_Sales AS Z_Score
    FROM `walmartsales dataset - walmartsales` w
    JOIN ProductStats p ON w.`Product line` = p.`Product line`
)
SELECT 
    `Invoice ID`, 
    `Product line`, 
    Total, 
    Z_Score
FROM SalesWithZScore
WHERE ABS(Z_Score) > 3;
