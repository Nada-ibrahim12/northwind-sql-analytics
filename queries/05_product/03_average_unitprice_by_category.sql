SELECT Products.CategoryID,
    Categories.CategoryName,
    AVG(UnitPrice) AS average_unit_price_by_category
FROM Products
    LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Products.CategoryID,
    Categories.CategoryName
ORDER BY average_unit_price_by_category DESC;