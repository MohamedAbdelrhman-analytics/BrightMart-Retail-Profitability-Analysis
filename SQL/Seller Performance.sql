with T as (select Sellers$.SellerName,
sum(orders.revenue) as total_revenue,
sum(orders.revenue - Orders.Cost) as total_profit,
count(distinct orderid) as total_orders
from Orders
join Sellers$
on Orders.SellerID =Sellers$.SellerID
group by Sellers$.SellerName),
ranking as (select * ,
rank()over(order by total_profit desc , total_revenue desc ) as g,
rank()over(order by total_profit asc , total_revenue asc ) as l
from t)
select *
from ranking
where g = 1 
or 
l = 1