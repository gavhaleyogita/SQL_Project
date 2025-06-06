select `Customer ID`,sum(Total) as revenue
from `walmartsales dataset - walmartsales`
group by `Customer ID`
order by revenue desc 
limit 5