with T as (select Customers$.CustomerName,
sum(orders.revenue) as total_revenue,
sum(orders.revenue - Orders.Cost) as total_profit,
sum(revenue -cost)*100.0/sum(revenue) as profit_margin,
count(distinct orderid) as total_orders
from Orders
join Customers$
on Orders.CustomerID =Customers$.CustomerID
group by Customers$.CustomerName)
,ranking as (select * ,
rank()over(order by total_profit desc , total_revenue desc ) as g,
rank()over(order by total_profit asc , total_revenue asc ) as l
from t)
select *
from ranking
where g = 1 
or 
l = 1