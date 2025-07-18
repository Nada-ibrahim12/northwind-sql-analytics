SELECT TOP(10) Products.SupplierID,
    Suppliers.CompanyName,
    COUNT(Quantity) AS total_quantity_sold
FROM [Order Details]
    LEFT JOIN Products ON [Order Details].ProductID = Products.ProductID
    LEFT JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
GROUP BY Suppliers.CompanyName,
    Products.SupplierID
ORDER BY total_quantity_sold DESC;