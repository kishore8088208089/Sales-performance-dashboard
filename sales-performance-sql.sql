CREATE DATABASE IF NOT EXISTS sales_portfolio;

USE sales_portfolio;

CREATE TABLE IF NOT EXISTS sales_data (
    order_id VARCHAR(20) PRIMARY KEY,
    order_date DATE,
    region VARCHAR(20),
    city VARCHAR(30),
    customer_segment VARCHAR(20),
    sales_channel VARCHAR(20),
    sales_rep VARCHAR(30),
    product_id VARCHAR(20),
    product_name VARCHAR(50),
    category VARCHAR(30),
    quantity INT,
    unit_price DECIMAL(10,2),
    discount_pct DECIMAL(5,2),
    revenue DECIMAL(12,2),
    cost DECIMAL(12,2),
    profit DECIMAL(12,2)
);
SELECT COUNT(*) AS total_rows
FROM sales_data;
SELECT 
    COUNT(*) AS total_orders,
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit,
    ROUND(SUM(profit) / SUM(revenue) * 100, 2) AS profit_margin_pct
FROM sales_data;
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;
SELECT
    product_name,
    category,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales_data
GROUP BY product_name, category
ORDER BY total_profit DESC;
SELECT
    region,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(revenue) * 100, 2) AS profit_margin_pct
FROM sales_data
GROUP BY region
ORDER BY total_profit DESC;
SELECT
    discount_pct,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(revenue) * 100, 2) AS profit_margin_pct
FROM sales_data
GROUP BY discount_pct
ORDER BY discount_pct;
SELECT
    sales_channel,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(revenue) * 100, 2) AS profit_margin_pct
FROM sales_data
GROUP BY sales_channel
ORDER BY total_profit DESC;
SELECT
    customer_segment,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(revenue) * 100, 2) AS profit_margin_pct
FROM sales_data
GROUP BY customer_segment
ORDER BY total_profit DESC;
SELECT
    category,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(revenue) * 100, 2) AS profit_margin_pct
FROM sales_data
GROUP BY category
ORDER BY total_profit DESC;