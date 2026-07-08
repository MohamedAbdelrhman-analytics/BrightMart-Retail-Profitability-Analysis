with T as (
    SELECT
        C.CategoryName,
        SUM(O.Revenue) AS Total_Revenue,
        SUM(O.Revenue - O.Cost) AS Total_Profit,
        sum(O.revenue -O.cost)*100.0/sum(O.revenue) as profit_margin,
        count(distinct O.orderid) as total_orders
    FROM Orders O
    JOIN Products$ P
        ON O.ProductID = P.ProductID
    JOIN Category$ C
        ON P.CategoryID = C.CategoryID
    GROUP BY C.CategoryName
),ranking as (select * ,
rank()over(order by total_revenue desc  ) as g
from t)
select *
from ranking
where g = 1
