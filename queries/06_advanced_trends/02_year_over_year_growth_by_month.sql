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
    LAG(total_revenue_of_month, 12) OVER (
        ORDER BY year, month
    ) AS previous_year_revenue,
    (
        total_revenue_of_month - LAG(total_revenue_of_month, 12) OVER (
            ORDER BY year, month
        )
    ) / NULLIF(
        LAG(total_revenue_of_month, 12) OVER (
            ORDER BY year, month
        ),
        0
    ) * 100 AS year_over_year_growth_percentage
    FROM MonthlyRevenue
ORDER BY year, month;