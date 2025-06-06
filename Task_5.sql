with paymentcounts as (
select city,Payment,count(*)as no_of_payment ,
rank() over (partition by city order by count(*) desc) as topaymentmode
from `walmartsales dataset - walmartsales`
group by city,payment )
select City, Payment AS Most_Popular_Payment_Method, no_of_payment
FROM paymentcounts
WHERE topaymentmode = 1;



