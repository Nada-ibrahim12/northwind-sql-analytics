-- Units sold by product
SELECT Products.ProductID AS ProductID,
    SUM(Quantity) AS TotalUnitsSold
FROM [Order Details]
    JOIN Products ON [Order Details].ProductID = Products.ProductID
GROUP BY Products.ProductID;