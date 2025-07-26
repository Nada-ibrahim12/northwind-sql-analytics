SELECT MONTH(o.OrderDate) AS month,
         YEAR(o.OrderDate) AS year,
         SUM(od.UnitPrice * od.Quantity) AS total_revenue_of_month,
         SUM(SUM(od.UnitPrice * od.Quantity)) OVER (ORDER BY YEAR(o.OrderDate), MONTH(o.OrderDate) ROWS BETWEEN 11 PRECEDING AND CURRENT ROW) AS rolling_12_month_revenue
         FROM Orders as o
         INNER JOIN [Order Details] as od ON o.OrderID = od.OrderID
         GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
         ORDER BY YEAR(o.OrderDate), MONTH(o.OrderDate);
         

WITH MonthlyRevenue AS (
    SELECT MONTH(o.OrderDate) AS month,
        YEAR(o.OrderDate) AS year,
        SUM(od.UnitPrice * od.Quantity) AS total_revenue_of_month
    FROM Orders AS o
        INNER JOIN [Order Details] AS od ON o.OrderID = od.OrderID
    GROUP BY YEAR(o.OrderDate),
        MONTH(o.OrderDate)
)
SELECT year,
    month,
    total_revenue_of_month,
    SUM(total_revenue_of_month) OVER (
        ORDER BY year,
            month ROWS BETWEEN 11 PRECEDING AND CURRENT ROW
    ) AS rolling_12_month_revenue
FROM MonthlyRevenue
ORDER BY year,
    month;