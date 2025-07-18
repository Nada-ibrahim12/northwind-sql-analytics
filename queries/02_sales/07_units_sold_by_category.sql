-- Units sold by category
SELECT Categories.CategoryID AS CategoryID,
    SUM(Quantity) AS TotalUnitsSold
FROM [Order Details]
    JOIN Products ON [Order Details].ProductID = Products.ProductID
    JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryID;