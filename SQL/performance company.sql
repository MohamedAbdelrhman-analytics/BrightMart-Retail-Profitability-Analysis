select year(orderdate) as years_orders,
month(orderdate) as month_orders,
sum(revenue) as total_revenue,
sum(revenue-cost) as total_profit,
sum(revenue -cost)*100.0/sum(revenue) as profit_margin,
count(distinct orderid) as total_orders,
count(distinct customerid) as num_customer
from Orders
group by year(orderdate),
month(orderdate)
order by years_orders asc ,  month_orders asc