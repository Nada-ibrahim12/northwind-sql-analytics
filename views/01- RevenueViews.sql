--1️. Total revenue (all orders)--
CREATE VIEW TotalRevenue AS
SELECT SUM(UnitPrice * Quantity) AS Revenue
FROM [Order Details];
GO

--2. Revenue by year--
CREATE VIEW RevenueByYear AS
SELECT YEAR(Orders.OrderDate) AS OrderYear,
    SUM(Quantity * UnitPrice) AS RevenueOfYear
FROM [Order Details]
    JOIN Orders ON [Order Details].OrderID = Orders.OrderID
GROUP BY YEAR(Orders.OrderDate);

GO
--3. Revenue by month--
CREATE VIEW RevenueByMonth AS
SELECT Month(Orders.OrderDate) AS OrderMonth,
    YEAR(Orders.OrderDate) AS OrderYear,
    SUM(Quantity * UnitPrice) AS RevenueOfMonth
FROM [Order Details]
    JOIN Orders ON [Order Details].OrderID = Orders.OrderID
GROUP BY Month(Orders.OrderDate),
    YEAR(Orders.OrderDate);

GO
--4. Revenue by country--
CREATE VIEW RevenueByCountry AS
SELECT Customers.Country AS Country,
    SUM(Quantity * UnitPrice) AS RevenueOfCountry
FROM [Order Details]
    JOIN Orders ON Orders.OrderID = [Order Details].OrderID
    JOIN Customers ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Country;

GO
--5. Revenue by city--
CREATE VIEW RevenueByCity AS
SELECT Customers.Country AS Country,
    Customers.City AS City,
    SUM(Quantity * UnitPrice) AS RevenueOfCity
FROM [Order Details]
    JOIN Orders ON Orders.OrderID = [Order Details].OrderID
    JOIN Customers ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.City,
    Customers.Country;

GO
--6. Revenue by customer--
CREATE VIEW RevenueByCustomer AS
SELECT Customers.CustomerID AS Customer,
    SUM(Quantity * UnitPrice) AS RevenueOfCustomer
FROM [Order Details]
    JOIN Orders ON Orders.OrderID = [Order Details].OrderID
    JOIN Customers ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID;

GO
--7. Revenue by sales employee--
CREATE VIEW RevenueBySalesEmployee AS
SELECT
    Employees.EmployeeID AS SalesEmployee,
    SUM(Quantity * UnitPrice) AS RevenueOfEmployee
FROM [Order Details]
JOIN Orders ON Orders.OrderID = [Order Details].OrderID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.EmployeeID;

GO 
--8. Revenue by shipper--
    CREATE VIEW RevenueByShipper AS
SELECT Shippers.ShipperID AS Shipper,
    SUM(Quantity * UnitPrice) AS RevenueOfShipper
FROM [Order Details]
    JOIN Orders ON Orders.OrderID = [Order Details].OrderID
    JOIN Shippers ON Shippers.ShipperID = Orders.ShipVia
GROUP BY Shippers.ShipperID;

GO
--9. Revenue by product--
Create VIEW RevenueByProduct AS
SELECT 
    [Order Details].ProductID AS Product,
    SUM(Quantity * UnitPrice) AS RevenueOfProduct
FROM [Order Details]
GROUP BY [Order Details].ProductID;

GO
--10. Revenue by supplier--
CREATE VIEW RevenueBySupplier AS
SELECT
    Products.SupplierID AS Supplier,
    SUM([Order Details].Quantity * [Order Details].UnitPrice) AS RevenueOfSupplier
FROM [Order Details]
    JOIN Products ON Products.ProductID = [Order Details].ProductID
    JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Products.SupplierID;