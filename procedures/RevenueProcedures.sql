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

GO -- Get revenue for a specific given month
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

GO -- Get revenue for a specific given month in  a specific year
    CREATE PROCEDURE RevenueInMonthInYearAndTotalOrders @Month INT,
    @YEAR INT AS BEGIN
SELECT YEAR(Orders.OrderDate) AS OrderYear,
    MONTH(Orders.OrderDate) AS OrderMonth,
    SUM(Quantity * UnitPrice) AS RevenueOfMonthInYear,
    COUNT(DISTINCT Orders.OrderID) AS TotalOrders
FROM [Order Details]
    JOIN Orders ON [Order Details].OrderID = Orders.OrderID
WHERE MONTH(Orders.OrderDate) = @Month
    AND YEAR(Orders.OrderDate) = @YEAR
GROUP BY MONTH(Orders.OrderDate),
    YEAR(Orders.OrderDate);
END;
