select* from `walmartsales dataset - walmartsales`;

WITH CustomerSpending AS (
    SELECT `Customer ID`,SUM(Total) AS Total_Spending
    FROM `walmartsales dataset - walmartsales`
    GROUP BY `Customer ID`
), 
SpendingPercentiles AS (
    SELECT CustomerSpending.*, 
	NTILE(3) OVER (ORDER BY Total_Spending DESC) AS Spending_Tier
    FROM CustomerSpending
)
SELECT `Customer ID`, Total_Spending,
    CASE 
        WHEN Spending_Tier = 1 THEN 'High Spender'
        WHEN Spending_Tier = 2 THEN 'Medium Spender'
        ELSE 'Low Spender'
    END AS Customer_Segment
FROM SpendingPercentiles;
