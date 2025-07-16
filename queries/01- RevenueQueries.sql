--1️. Total revenue (all orders)--
SELECT *
FROM TotalRevenue;

--2. Revenue by year--
SELECT *
FROM RevenueByYear
ORDER BY OrderYear ASC;

--3. Revenue by month--
SELECT *
FROM RevenueByMonth
ORDER BY OrderYear ASC,
    OrderMonth ASC;

--4. Revenue by country--
SELECT *
FROM RevenueByCountry;

--5. Revenue by city--
SELECT *
FROM RevenueByCity
ORDER BY Country;

--6. Revenue by customer--
SELECT *
FROM RevenueByCustomer
ORDER BY Customer;

--7. Revenue by sales employee--
SELECT * FROM RevenueBySalesEmployee
ORDER BY SalesEmployee;

--8. Revenue by shipper--
SELECT * FROM RevenueByShipper;;

--9. Revenue by product--
SELECT * FROM RevenueByProduct
ORDER BY Product;

--10. Revenue by supplier--
SELECT * FROM RevenueBySupplier
ORDER BY Supplier;

