-- Smallest single order value
SELECT MIN(UNITPRICE * Quantity) AS SmallestSingleOrderValue
FROM [Order Details];