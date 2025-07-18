SELECT TOP(1) ShipVia, COUNT(*) AS num_of_usage
FROM Orders
GROUP BY ShipVia
ORDER BY num_of_usage DESC