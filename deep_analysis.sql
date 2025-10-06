/* ======================================================
   E-Commerce Internet Sales Deep Analysis (MS SQL Server)
   Covers: EDA, Data Quality, Transformations, Deep KPIs
   ====================================================== */

----------------------------------------------------------
-- 1. EDA: Data Overview
----------------------------------------------------------
-- Count records in each table
SELECT 'DIM_Calendar' AS TableName, COUNT(*) AS RowCount FROM DIM_Calendar
UNION ALL
SELECT 'DIM_Customer', COUNT(*) FROM DIM_Customer
UNION ALL
SELECT 'DIM_Product', COUNT(*) FROM DIM_Product
UNION ALL
SELECT 'FACT_InternetSales', COUNT(*) FROM FACT_InternetSales;

-- Preview first 10 sales
SELECT TOP 10 * FROM FACT_InternetSales;

----------------------------------------------------------
-- 2. Data Quality Checks
----------------------------------------------------------
-- Null checks
SELECT 
    SUM(CASE WHEN CustomerKey IS NULL THEN 1 ELSE 0 END) AS NullCustomers,
    SUM(CASE WHEN ProductKey IS NULL THEN 1 ELSE 0 END) AS NullProducts,
    SUM(CASE WHEN SalesAmount IS NULL THEN 1 ELSE 0 END) AS NullSales
FROM FACT_InternetSales;

-- Negative or zero sales
SELECT * FROM FACT_InternetSales
WHERE SalesAmount <= 0;

----------------------------------------------------------
-- 3. Transformations
----------------------------------------------------------
-- Create a view with enriched Sales fact (joins)
CREATE OR ALTER VIEW vw_FactSalesEnriched AS
SELECT 
    f.SalesOrderNumber,
    f.SalesAmount,
    c.CustomerKey,
    c.FullName,
    c.Gender,
    c.[Customer City],
    p.[Product Name],
    p.[Product Category],
    p.[Sub Category],
    cal.Date,
    cal.Year,
    cal.MonthNo,
    cal.Month,
    cal.Quarter
FROM FACT_InternetSales f
JOIN DIM_Customer c ON f.CustomerKey = c.CustomerKey
JOIN DIM_Product p ON f.ProductKey = p.ProductKey
JOIN DIM_Calendar cal ON f.OrderDateKey = cal.DateKey;

----------------------------------------------------------
-- 4. Customer Insights
----------------------------------------------------------
-- Top 10 Customers by Sales
SELECT TOP 10 
    FullName, SUM(SalesAmount) AS TotalSales
FROM vw_FactSalesEnriched
GROUP BY FullName
ORDER BY TotalSales DESC;

-- Sales by Gender
SELECT Gender, SUM(SalesAmount) AS TotalSales
FROM vw_FactSalesEnriched
GROUP BY Gender;

-- Sales by City (Top 10)
SELECT TOP 10 [Customer City], SUM(SalesAmount) AS TotalSales
FROM vw_FactSalesEnriched
GROUP BY [Customer City]
ORDER BY TotalSales DESC;

----------------------------------------------------------
-- 5. Product Insights
----------------------------------------------------------
-- Top 10 Products
SELECT TOP 10 [Product Name], SUM(SalesAmount) AS TotalSales
FROM vw_FactSalesEnriched
GROUP BY [Product Name]
ORDER BY TotalSales DESC;

-- Sales by Product Category
SELECT [Product Category], SUM(SalesAmount) AS TotalSales
FROM vw_FactSalesEnriched
GROUP BY [Product Category]
ORDER BY TotalSales DESC;

----------------------------------------------------------
-- 6. Time-Series Analysis
----------------------------------------------------------
-- Monthly Sales Trend
SELECT Year, MonthNo, SUM(SalesAmount) AS TotalSales
FROM vw_FactSalesEnriched
GROUP BY Year, MonthNo
ORDER BY Year, MonthNo;

-- Sales vs Budget
SELECT 
    v.Year,
    v.MonthNo,
    SUM(v.SalesAmount) AS ActualSales,
    b.Budget
FROM vw_FactSalesEnriched v
JOIN SalesBudget b 
    ON v.Year = YEAR(b.[Date]) AND v.MonthNo = MONTH(b.[Date])
GROUP BY v.Year, v.MonthNo, b.Budget
ORDER BY v.Year, v.MonthNo;

----------------------------------------------------------
-- 7. Deep Insights (Customer Segmentation / RFM)
----------------------------------------------------------
-- Recency: days since last purchase per customer
;WITH CustomerRecency AS (
    SELECT 
        CustomerKey,
        MAX(Date) AS LastPurchase
    FROM vw_FactSalesEnriched
    GROUP BY CustomerKey
)
SELECT 
    c.CustomerKey,
    DATEDIFF(DAY, cr.LastPurchase, GETDATE()) AS RecencyDays,
    COUNT(DISTINCT v.SalesOrderNumber) AS Frequency,
    SUM(v.SalesAmount) AS Monetary
FROM vw_FactSalesEnriched v
JOIN CustomerRecency cr ON v.CustomerKey = cr.CustomerKey
JOIN DIM_Customer c ON v.CustomerKey = c.CustomerKey
GROUP BY c.CustomerKey, cr.LastPurchase;

----------------------------------------------------------
-- 8. Correlation Prep (Numerical EDA)
----------------------------------------------------------
-- Sales vs Month / Year distribution
SELECT Year, MonthNo, AVG(SalesAmount) AS AvgSales, SUM(SalesAmount) AS TotalSales
FROM vw_FactSalesEnriched
GROUP BY Year, MonthNo
ORDER BY Year, MonthNo;
