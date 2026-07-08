SELECT Customers$.CustomerName,
sum(orders.Revenue) as total_revenue,
MAX(ORDERS.orderdate) as last_order,
datediff(day,MAX(ORDERS.orderdate),GETDATE()) as count_day,
case
when datediff(day,MAX(ORDERS.orderdate),GETDATE()) > 90 then 'inactive'
else 'active'
end as q
from orders
join Customers$
on Orders.CustomerID = Customers$.CustomerID
group by  Customers$.CustomerName
order by q desc
