-- Get revenue for a specific given year
CREATE PROCEDURE RevenueInYearAndTotalOrders @Year INT AS BEGIN
SELECT YEAR(Orders.OrderDate) AS OrderYear,
    SUM(Quantity * UnitPrice) AS RevenueOfYear,
    COUNT(DISTINCT Orders.OrderID) AS TotalOrders
FROM [Order Details]
    JOIN Orders ON [Order Details].OrderID = Orders.OrderID
WHERE YEAR(Orders.OrderDate) = @Year
GROUP BY YEAR(Orders.OrderDate);
END;

EXECUTE RevenueInYearAndTotalOrders @Year = 1996;