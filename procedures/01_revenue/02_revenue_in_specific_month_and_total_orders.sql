-- Get revenue for a specific given month
    CREATE PROCEDURE RevenueInMonthAndTotalOrders @Month INT AS BEGIN
SELECT YEAR(Orders.OrderDate),
    MONTH(Orders.OrderDate) AS OrderMonth,
    SUM(Quantity * UnitPrice) AS RevenueOfMonth,
    COUNT(DISTINCT Orders.OrderID) AS TotalOrders
FROM [Order Details]
    JOIN Orders ON [Order Details].OrderID = Orders.OrderID
WHERE MONTH(Orders.OrderDate) = @Month
GROUP BY MONTH(Orders.OrderDate),
    YEAR(Orders.OrderDate);
END;

EXECUTE RevenueInMonthAndTotalOrders @Month = 5;