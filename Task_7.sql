select * from `walmartsales dataset - walmartsales`;

WITH ProductSales AS (
    SELECT `Customer type`, `Product line` , SUM(Total) AS Total_Sales,
	RANK() OVER (PARTITION BY `Customer type` ORDER BY SUM(Total) DESC) AS Product_Rank
    FROM `walmartsales dataset - walmartsales`
    GROUP BY `Customer type`, `Product line`
)
SELECT `Customer type`, `Product line` AS Best_Product_Line, Total_Sales
FROM ProductSales
WHERE Product_Rank = 1;
