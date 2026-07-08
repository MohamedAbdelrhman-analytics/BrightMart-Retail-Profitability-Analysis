select year(orderdate) as year_orders,
month(orderdate) as month_orders,
sum(revenue ) as total_revenue
from Orders
group by year(orderdate) , month(orderdate) 
order by year_orders desc , month_orders desc