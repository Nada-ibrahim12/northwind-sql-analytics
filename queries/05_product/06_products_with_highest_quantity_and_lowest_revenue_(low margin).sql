SELECT TOP(10) ProductID, SUM(Quantity) AS total_quantity_sold,
SUM(Quantity * [Order Details].UnitPrice) AS total_revenue
FROM [Order Details]
GROUP BY ProductID