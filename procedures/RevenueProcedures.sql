-- Get revenue for a specific given year
CREATE PROCEDURE RevenueInYear @Year INT AS
BEGIN
    SELECT YEAR(Orders.OrderDate) AS OrderYear,
        SUM(Quantity * UnitPrice) AS RevenueOfYear
    FROM [Order Details]
        JOIN Orders ON [Order Details].OrderID = Orders.OrderID
    WHERE YEAR(Orders.OrderDate) = @Year
    GROUP BY YEAR(Orders.OrderDate);
END;

GO
-- Get revenue for a specific given month
CREATE PROCEDURE RevenueInMonth @Month INT AS BEGIN
SELECT YEAR(Orders.OrderDate),
    MONTH(Orders.OrderDate) AS OrderYear,
    SUM(Quantity * UnitPrice) AS RevenueOfYear
FROM [Order Details]
    JOIN Orders ON [Order Details].OrderID = Orders.OrderID
WHERE MONTH(Orders.OrderDate) = @Month
GROUP BY MONTH(Orders.OrderDate),
    YEAR(Orders.OrderDate);
END;