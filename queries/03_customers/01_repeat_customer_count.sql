SELECT Customers.CustomerID, COUNT(*) AS RepeatCount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID;