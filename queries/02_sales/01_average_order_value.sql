--Average order value (AOV) overall
-- we use the created view TotalRevenue to calculate the average order value
-- AOV = Total Revenue / Total Orders
-- we can use SUM() and Count() functions to calculate the average order value
SELECT Revenue / TotalOrders AS AverageOrderValue
FROM TotalRevenue;