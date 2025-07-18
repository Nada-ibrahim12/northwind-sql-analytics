SELECT COUNT(*) AS num_of_late_shipments
FROM Orders
WHERE ShippedDate > RequiredDate;