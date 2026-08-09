-- ============================================================
-- Project 2: Sales Performance Case Study
-- SQL Stage: Query & Aggregation (PostgreSQL, hosted on Supabase)
-- Business Question: Which products, regions, and customer
-- segments drive sales performance, and how has that changed
-- over time?
-- ============================================================

-- ------------------------------------------------------------
-- Setup: fix Order Date / Ship Date column types
-- (Imported from CSV as text in DD/MM/YYYY format; converted
-- to proper DATE type to enable date functions.)
-- ------------------------------------------------------------
ALTER TABLE sales 
ALTER COLUMN "Order Date" TYPE DATE 
USING TO_DATE("Order Date", 'DD/MM/YYYY');

ALTER TABLE sales 
ALTER COLUMN "Ship Date" TYPE DATE 
USING TO_DATE("Ship Date", 'DD/MM/YYYY');

-- Sanity check: confirm row count matches source CSV (9,800 rows)
SELECT COUNT(*) FROM sales;


-- ------------------------------------------------------------
-- 1. Total sales by Region
-- Answers: which regions generate the most revenue overall
-- ------------------------------------------------------------
SELECT "Region", ROUND(SUM("Sales")::numeric, 2) AS total_sales
FROM sales
GROUP BY "Region"
ORDER BY total_sales DESC;


-- ------------------------------------------------------------
-- 2. Total sales by Category and Sub-Category
-- Answers: which product categories/sub-categories drive sales
-- ------------------------------------------------------------
SELECT "Category", "Sub-Category", ROUND(SUM("Sales")::numeric, 2) AS total_sales
FROM sales
GROUP BY "Category", "Sub-Category"
ORDER BY total_sales DESC;


-- ------------------------------------------------------------
-- 3. Total sales by Customer Segment
-- Answers: which customer segment (Consumer/Corporate/etc.)
-- contributes most to revenue
-- ------------------------------------------------------------
SELECT "Segment", ROUND(SUM("Sales")::numeric, 2) AS total_sales
FROM sales
GROUP BY "Segment"
ORDER BY total_sales DESC;


-- ------------------------------------------------------------
-- 4. Monthly sales trend
-- Answers: how has sales performance changed over time
-- ------------------------------------------------------------
SELECT 
    DATE_TRUNC('month', "Order Date") AS sales_month,
    ROUND(SUM("Sales")::numeric, 2) AS total_sales
FROM sales
GROUP BY sales_month
ORDER BY sales_month;


-- ------------------------------------------------------------
-- 5. Top 10 products by sales
-- Answers: which individual products are the top revenue drivers
-- ------------------------------------------------------------
SELECT "Product Name", ROUND(SUM("Sales")::numeric, 2) AS total_sales
FROM sales
GROUP BY "Product Name"
ORDER BY total_sales DESC
LIMIT 10;


-- ------------------------------------------------------------
-- 6. Region x Category cross-tab
-- Answers: which product categories perform best within each
-- region (multi-dimensional breakdown)
-- ------------------------------------------------------------
SELECT "Region", "Category", ROUND(SUM("Sales")::numeric, 2) AS total_sales
FROM sales
GROUP BY "Region", "Category"
ORDER BY "Region", total_sales DESC;
