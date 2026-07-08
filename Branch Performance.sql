with T as (select Branches$.BranchName,
sum(orders.revenue) as total_revenue,
sum(orders.revenue - Orders.Cost) as total_profit,
sum(orders.revenue - Orders.Cost)*100.0/sum(orders.revenue) as profit_margin,
count(distinct orderid) as total_orders
from Orders
join Branches$
on Orders.BranchID =Branches$.BranchID
group by Branches$.BranchName),
ranking as (select * ,
rank()over(order by total_revenue desc , total_profit desc) as highlevel,
rank()over(order by total_revenue asc , total_profit asc)as lowlevel
from T)
select *
from ranking
where highlevel = 1
or
lowlevel =1 