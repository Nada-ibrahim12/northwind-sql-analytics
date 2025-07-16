# northwind-sql-analytics

Practical SQL Server practice project with 50+ KPIs, Views, Stored Procedures, Functions, and advanced reporting logic — all using the classic Northwind sample database.

---

## About

This project is a comprehensive SQL Server practice space to build real-world skills in:
- Business KPIs
- Views
- Stored Procedures
- User-Defined Functions (UDFs)
- Window Functions & CTEs
- Performance Tuning & Indexing

**Goal:** Practice production-ready T-SQL patterns used in data analysis, BI, and data engineering.

---

## What’s Included

- `/views/` — `CREATE VIEW` scripts for reusable reporting logic
- `/procedures/` — Stored Procedures for parameterized queries
- `/functions/` — User-Defined Functions for reusable calculations
- `/queries/` — Raw SQL practice queries covering 50+ business KPIs
- ER Diagram — Northwind schema for reference

---

## Example KPIs

- Total revenue & revenue trends by year, month, quarter
- Revenue by country, customer, product, category, supplier
- Average order value (AOV) overall & by customer segments
- Top-selling products & suppliers
- Order trends & shipping performance
- Employee performance & orders handled
- Repeat vs new customers
- Freight cost analysis

…and many more

---

## How to Use

1. Clone this repo  
2. Load the Northwind database into SQL Server (using the `.bak` or `.sql` script)  
3. Run the scripts in `/views/`, `/procedures/` using SQL Server Management Studio (SSMS)  
4. Modify and expand — test your own variations and optimize performance

---

## Why This Exists

This project helps me practice end-to-end T-SQL skills for real business scenarios, building confidence for:
- Data Engineering
- Data Analysis
- BI Development
- Reporting Automation

---

## Credits

- Database: [Northwind Traders](https://github.com/Microsoft/sql-server-samples)

---

## Status

RDBMS: SQL Server 2019+  
50+ KPIs planned  
30+ Views  
10+ Stored Procedures  
5+ User-Defined Functions  
All queries tested and versioned
