--Average order value (AOV) overall
-- we use the created view TotalRevenue to calculate the average order value
-- AOV = Total Revenue / Total Orders
-- we can use SUM() and Count() functions to calculate the average order value
SELECT Revenue / TotalOrders AS AverageOrderValue
FROM TotalRevenue;

-- Average order value by employee
-- we use the created view RevenueBySalesEmployee to calculate the average order value by employee
-- but we will use AVG(), to perform the same calculation in a different way
Select SUM(UnitPrice * Quantity) / COUNT(DISTINCT Orders.OrderID) AS AverageOrderValueByEmployee
FROM [Order Details]
    JOIN Orders ON [Order Details].OrderID = Orders.OrderID
    Join Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID;

-- Largest single order value
SELECT MAX(UNITPRICE * Quantity) AS LargestSingleOrderValue
FROM [Order Details];

-- Smallest single order value
SELECT MIN(UNITPRICE * Quantity) AS SmallestSingleOrderValue
FROM [Order Details];

-- Total units sold overall
SELECT SUM(Quantity) AS TotalUnitsSold
FROM [Order Details];

-- Units sold by product
SELECT 
    Products.ProductID AS ProductID,
    SUM(Quantity) AS TotalUnitsSold
    FROM [Order Details]
    JOIN Products ON [Order Details].ProductID = Products.ProductID
GROUP BY Products.ProductID;

-- Units sold by category
SELECT Categories.CategoryID AS CategoryID,
    SUM(Quantity) AS TotalUnitsSold
FROM [Order Details]
    JOIN Products ON [Order Details].ProductID = Products.ProductID
    JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryID;