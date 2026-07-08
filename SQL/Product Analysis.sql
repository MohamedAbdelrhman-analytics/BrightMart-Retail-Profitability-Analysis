with T as (select Products$.ProductName,
sum(orders.revenue) as total_revenue,
sum(orders.revenue - Orders.Cost) as total_profit,
sum(orders.revenue -orders.cost)*100.0/sum(revenue) as profit_margin,
count(distinct orderid) as total_orders
from Orders
join Products$
on Orders.ProductID =Products$.ProductID
group by Products$.ProductName,Products$.ProductID)
,ranking as (select * ,
rank()over(order by total_revenue desc  ) as g
from t)
select *
from ranking
where g = 1 
