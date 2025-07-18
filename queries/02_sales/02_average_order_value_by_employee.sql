-- Average order value by employee
-- we use the created view RevenueBySalesEmployee to calculate the average order value by employee
-- but we will use AVG(), to perform the same calculation in a different way
Select SUM(UnitPrice * Quantity) / COUNT(DISTINCT Orders.OrderID) AS AverageOrderValueByEmployee
FROM [Order Details]
    JOIN Orders ON [Order Details].OrderID = Orders.OrderID
    Join Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID;