WITH customer_year_orders AS (
    SELECT 
        Orders.CustomerID,
        YEAR(Orders.OrderDate) AS order_year,
        COUNT(Orders.OrderID) AS year_orders
    FROM Orders
    GROUP BY Orders.CustomerID, YEAR(Orders.OrderDate)
)
SELECT 
    o.CustomerID,
    YEAR(o.OrderDate) AS order_year,
    SUM(od.Quantity * od.UnitPrice) AS total_revenue,
    AVG(cyo.year_orders) AS average_orders,
    AVG(od.Quantity * od.UnitPrice) AS average_order_value
FROM Orders o
LEFT JOIN [Order Details] od ON od.OrderID = o.OrderID
LEFT JOIN customer_year_orders cyo ON cyo.CustomerID = o.CustomerID AND cyo.order_year = YEAR(o.OrderDate)
GROUP BY o.CustomerID, YEAR(o.OrderDate)
ORDER BY o.CustomerID, order_year;
