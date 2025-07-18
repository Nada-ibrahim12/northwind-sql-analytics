-- Largest single order value
SELECT MAX(UNITPRICE * Quantity) AS LargestSingleOrderValue
FROM [Order Details];