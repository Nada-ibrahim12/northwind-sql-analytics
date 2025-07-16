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