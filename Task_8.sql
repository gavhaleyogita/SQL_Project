with no_of_days as(
select
`Customer ID`,
   STR_TO_DATE(Date,'%d-%m-%Y') AS current_dt,
   lead(STR_TO_DATE(Date,'%d-%m-%Y')) over(partition by `Customer ID` order by STR_TO_DATE(Date,'%d-%m-%Y') ) as Next_Date
 from `walmartsales dataset - walmartsales`)
select `Customer ID`,current_dt,Next_Date,
DATEDIFF(Next_Date,current_dt) AS Total_Days
from no_of_days
where DATEDIFF(Next_Date,current_dt) <= 30
group by `Customer ID`,current_dt,Next_Date

