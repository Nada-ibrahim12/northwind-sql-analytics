SELECT TOP 10 Customers.CustomerID,
    COUNT(*) AS RepeatCount
FROM Orders
    JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID
ORDER BY RepeatCount DESC
