select 
weekday(STR_TO_DATE(Date,'%d-%m-%Y')) as Day_of_week,sum(Total) as total_sale
from `walmartsales dataset - walmartsales`
group by Day_of_week
order by total_sale desc

